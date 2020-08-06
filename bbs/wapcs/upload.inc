<%
Dim DoteyUpload_SourceData

Class DoteyUpload
	
	Public Files
	Public Form
	Public MaxTotalBytes
	Public Version
	Public ProgressID
	Public ErrMsg
	
	Private BytesRead
	Private ChunkReadSize
	Private Info
	Private Progress

	Private UploadProgressInfo
	Private CrLf

	Private Sub Class_Initialize()
		Set Files = Server.CreateObject("Scripting.Dictionary")	' 上传文件集合
		Set Form = Server.CreateObject("Scripting.Dictionary")	' 表单集合
		UploadProgressInfo = "DoteyUploadProgressInfo"  ' Application的Key
		MaxTotalBytes = 1 *1024 *1024 *1024 ' 默认最大1G
		ChunkReadSize = 64 * 1024	' 分块大小64K
		CrLf = Chr(13) & Chr(10)	' 换行

		Set DoteyUpload_SourceData = Server.CreateObject("ADODB.Stream")
		DoteyUpload_SourceData.Type = 1 ' 二进制流
		DoteyUpload_SourceData.Open

		Version = "1.0 Beta"	' 版本
		ErrMsg = ""	' 错误信息

	End Sub

	' 将文件根据其文件名统一保存在某路径下
	Public Sub SaveTo(path)
		
		Upload()	' 上传

		if right(path,1) <> "/" then path = path & "/" 

		' 遍历所有已上传文件
		For Each fileItem In Files.Items			
			fileItem.SaveAs path & fileItem.FileName
		Next


	End Sub

	' 分析上传的数据，并保存到相应集合中
	Public Sub Upload ()

		Dim TotalBytes, Boundary
		TotalBytes = Request.TotalBytes	 ' 总大小
		If TotalBytes < 1 Then
			Raise("无数据传入")
			Exit Sub
		End If
		If TotalBytes > MaxTotalBytes Then
			Raise("&#x60A8;&#x5F53;&#x524D;&#x4E0A;&#x4F20;&#x5927;&#x5C0F;&#x4E3A;" & TotalBytes/1000 & " K，&#x6700;&#x5927;&#x5141;&#x8BB8;&#x4E3A;" & MaxTotalBytes/1024 & "K<br/><anchor>&#x8FD4;&#x56DE;&#x4E0A;&#x4E00;&#x9875;<prev/></anchor><br/></p></card></wml>")
			Exit Sub
		End If
		Boundary = GetBoundary()
		If IsNull(Boundary) Then 
			Raise("&#x5982;&#x679C;form&#x4E2D;&#x6CA1;&#x6709;&#x5305;&#x62EC;multipart/form-data&#x4E0A;&#x4F20;&#x662F;&#x65E0;&#x6548;&#x7684;")
			Exit Sub	 ''如果form中没有包括multipart/form-data上传是无效的
		End If
		Boundary = StringToBinary(Boundary)
		

		Dim DataPart, PartSize
		BytesRead = 0

		'循环分块读取
		Do While BytesRead < TotalBytes

			'分块读取
			PartSize = ChunkReadSize
			if PartSize + BytesRead > TotalBytes Then PartSize = TotalBytes - BytesRead
			DataPart = Request.BinaryRead(PartSize)
			BytesRead = BytesRead + PartSize

			DoteyUpload_SourceData.Write DataPart




		Loop

		Dim Binary
		DoteyUpload_SourceData.Position = 0
		Binary = DoteyUpload_SourceData.Read

		Dim BoundaryStart, BoundaryEnd, PosEndOfHeader, IsBoundaryEnd
		Dim Header, bFieldContent
		Dim FieldName
		Dim File
		Dim TwoCharsAfterEndBoundary

		BoundaryStart = InStrB(Binary, Boundary)
		BoundaryEnd = InStrB(BoundaryStart + LenB(Boundary), Binary, Boundary, 0)

		Do While (BoundaryStart > 0 And BoundaryEnd > 0 And Not IsBoundaryEnd)
			' 获取表单头的结束位置
			PosEndOfHeader = InStrB(BoundaryStart + LenB(Boundary), Binary, StringToBinary(vbCrLf + vbCrLf))
						
			' 分离表单头信息，类似于：
			' Content-Disposition: form-data; name="file1"; filename="G:\homepage.txt"
			' Content-Type: text/plain
			Header = BinaryToString(MidB(Binary, BoundaryStart + LenB(Boundary) + 2, PosEndOfHeader - BoundaryStart - LenB(Boundary) - 2))

			' 分离表单内容
			bFieldContent = MidB(Binary, (PosEndOfHeader + 4), BoundaryEnd - (PosEndOfHeader + 4) - 2)
			
			FieldName = GetFieldName(Header)
			' 如果是附件
			If InStr (Header,"filename=""") > 0 Then
				Set File = New FileInfo
				
				' 获取文件相关信息
				Dim clientPath
				clientPath = GetFileName(Header)
				File.FileName = GetFileNameByPath(clientPath)
				File.FileExt = GetFileExt(clientPath)
				File.FilePath = clientPath
				File.FileType = GetFileType(Header)
				File.FileStart = PosEndOfHeader + 3
				File.FileSize = BoundaryEnd - (PosEndOfHeader + 4) - 2
				File.FormName = FieldName

				' 如果该文件不为空并不存在该表单项保存之
				If Not Files.Exists(FieldName) And File.FileSize > 0 Then
					Files.Add FieldName, File
				End If
			'表单数据				
			Else
				' 允许同名表单
				If Form.Exists(FieldName) Then
					Form(FieldName) = Form(FieldName) & "," & BinaryToString(bFieldContent)
				Else
					Form.Add FieldName, BinaryToString(bFieldContent)
				End If
			End If

			' 是否结束位置
			TwoCharsAfterEndBoundary = BinaryToString(MidB(Binary, BoundaryEnd + LenB(Boundary), 2))
			IsBoundaryEnd = TwoCharsAfterEndBoundary = "--"

			If Not IsBoundaryEnd Then ' 如果不是结尾, 继续读取下一块
				BoundaryStart = BoundaryEnd
				BoundaryEnd = InStrB(BoundaryStart + LenB(Boundary), Binary, Boundary)
			End If
		Loop
		

	End Sub

	'异常信息
	Private Sub Raise(Message)
		ErrMsg = ErrMsg & "[" & Now & "]" & Message
		
		
		'call Err.Raise(vbObjectError, "DoteyUpload", Message)

	End Sub

	' 取边界值
	Private Function GetBoundary()
		Dim ContentType, ctArray, bArray
		ContentType = Request.ServerVariables("HTTP_CONTENT_TYPE")
		ctArray = Split(ContentType, ";")
		If Trim(ctArray(0)) = "multipart/form-data" Then
			bArray = Split(Trim(ctArray(1)), "=")
			GetBoundary = "--" & Trim(bArray(1))
		Else	'如果form中没有包括multipart/form-data上传是无效的
			GetBoundary = null
			Raise("&#x5982;&#x679C;form&#x4E2D;&#x6CA1;&#x6709;&#x5305;&#x62EC;multipart/form-data&#x4E0A;&#x4F20;&#x662F;&#x65E0;&#x6548;&#x7684;")
		End If
	End Function


	' 将二进制流转化成文本
	Private Function BinaryToString(xBinary)
		Dim Binary
		if vartype(xBinary) = 8 then Binary = MultiByteToBinary(xBinary) else Binary = xBinary
		
	  Dim RS, LBinary
	  Const adLongVarChar = 201
	  Set RS = CreateObject("ADODB.Recordset")
	  LBinary = LenB(Binary)
		
		if LBinary>0 then
			RS.Fields.Append "mBinary", adLongVarChar, LBinary
			RS.Open
			RS.AddNew
				RS("mBinary").AppendChunk Binary 
			RS.Update
			BinaryToString = RS("mBinary")
		Else
			BinaryToString = ""
		End If
	End Function



	Function MultiByteToBinary(MultiByte)
	  Dim RS, LMultiByte, Binary
	  Const adLongVarBinary = 205
	  Set RS = CreateObject("ADODB.Recordset")
	  LMultiByte = LenB(MultiByte)
		if LMultiByte>0 then
			RS.Fields.Append "mBinary", adLongVarBinary, LMultiByte
			RS.Open
			RS.AddNew
				RS("mBinary").AppendChunk MultiByte & ChrB(0)
			RS.Update
			Binary = RS("mBinary").GetChunk(LMultiByte)
		End If
	  MultiByteToBinary = Binary
	End Function



	' 字符串到二进制
	Function StringToBinary(String)
		Dim I, B
		For I=1 to len(String)
			B = B & ChrB(Asc(Mid(String,I,1)))
		Next
		StringToBinary = B
	End Function



	'返回表单名
	Private Function GetFieldName(infoStr)
		Dim sPos, EndPos
		sPos = InStr(infoStr, "name=")
		EndPos = InStr(sPos + 6, infoStr, Chr(34) & ";")
		If EndPos = 0 Then
			EndPos = inStr(sPos + 6, infoStr, Chr(34))
		End If
		GetFieldName = Mid(infoStr, sPos + 6, endPos - _
			(sPos + 6))
	End Function


	'返回文件名
	Private Function GetFileName(infoStr)
		Dim sPos, EndPos
		sPos = InStr(infoStr, "filename=")
		EndPos = InStr(infoStr, Chr(34) & CrLf)

		if infostr<>"" and sPos<>0 and EndPos<>0 then
			GetFileName = Mid(infoStr, sPos + 10, EndPos - (sPos + 10))
		else
			Response.Write "<card id='index' title='&#x4E0A;&#x4F20;&#x51FA;&#x9519;'><p align='left'>&#x8BF7;&#x9009;&#x62E9;&#x6587;&#x4EF6;!<br/><anchor>&#x8FD4;&#x56DE;&#x4E0A;&#x4E00;&#x9875;<prev/></anchor><br/></p></card></wml>"
  		 Response.End()
		end if
	End Function


	'返回文件的 MIME type
	Private Function GetFileType(infoStr)
		sPos = InStr(infoStr, "Content-Type: ")
		GetFileType = Mid(infoStr, sPos + 14)
	End Function

	'根据路径获取文件名
	Private Function GetFileNameByPath(FullPath)
		Dim pos
		pos = 0
		FullPath = Replace(FullPath, "/", "\")
		pos = InStrRev(FullPath, "\") + 1
		If (pos > 0) Then
			GetFileNameByPath = Mid(FullPath, pos)
		Else
			GetFileNameByPath = FullPath
		End If
	End Function

	'根据路径获取扩展名
	Private Function GetFileExt(FullPath)
		Dim pos
		pos = InStrRev(FullPath,".")
		if pos>0 then GetFileExt = Mid(FullPath, Pos)
	End Function



End Class


'---------------------------------------------------
' 文件信息 类
'---------------------------------------------------
Class FileInfo
	
	Dim FormName, FileName, FilePath, FileSize, FileType, FileStart, FileExt, NewFileName

	Private Sub Class_Initialize 
		FileName = ""		' 文件名
		FilePath = ""			' 客户端路径
		FileSize = 0			' 文件大小
		FileStart= 0			' 文件开始位置
		FormName = ""	' 表单名
		FileType = ""		' 文件Content Type
		FileExt = ""			' 文件扩展名
		NewFileName = ""	'上传后文件名
	End Sub

	Public Function Save()
		SaveAs(FileName)
	End Function

	' 保存文件
	Public Function SaveAs(fullpath)
		Dim dr
		SaveAs = false
		If trim(fullpath) = "" Or FileStart = 0 Or FileName = "" Or right(fullpath,1) = "/" Then Exit Function
		
		NewFileName = GetFileNameByPath(fullpath)

		Set dr = CreateObject("Adodb.Stream")
		dr.Mode = 3
		dr.Type = 1
		dr.Open
		DoteyUpload_SourceData.position = FileStart
		DoteyUpload_SourceData.copyto dr, FileSize
		dr.SaveToFile MapPath(FullPath), 2
		dr.Close
		set dr = nothing 
		SaveAs = true
	End function

	' 返回Binary
	Public Function GetBinary()
		Dim Binary
		If FileStart = 0 Then Exit Function

		DoteyUpload_SourceData.Position = FileStart
		Binary = DoteyUpload_SourceData.Read(FileSize)

		GetBinary = Binary
	End function

	' 取服务器端路径
	Private Function MapPath(Path)
		If InStr(1, Path, ":") > 0 Or Left(Path, 2) = "\\" Then
			MapPath = Path 
		Else 
			MapPath = Server.MapPath(Path)
		End If
	End function

	'根据路径获取文件名
	Private Function GetFileNameByPath(FullPath)
		Dim pos
		pos = 0
		FullPath = Replace(FullPath, "/", "\")
		pos = InStrRev(FullPath, "\") + 1
		If (pos > 0) Then
			GetFileNameByPath = Mid(FullPath, pos)
		Else
			GetFileNameByPath = FullPath
		End If
	End Function

End Class

%>
