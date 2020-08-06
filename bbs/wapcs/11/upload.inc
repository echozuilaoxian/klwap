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
		Set Files = Server.CreateObject("Scripting.Dictionary")	' �ϴ��ļ�����
		Set Form = Server.CreateObject("Scripting.Dictionary")	' ��������
		UploadProgressInfo = "DoteyUploadProgressInfo"  ' Application��Key
		MaxTotalBytes = 1 *1024 *1024 *1024 ' Ĭ�����1G
		ChunkReadSize = 64 * 1024	' �ֿ��С64K
		CrLf = Chr(13) & Chr(10)	' ����

		Set DoteyUpload_SourceData = Server.CreateObject("ADODB.Stream")
		DoteyUpload_SourceData.Type = 1 ' ��������
		DoteyUpload_SourceData.Open

		Version = "1.0 Beta"	' �汾
		ErrMsg = ""	' ������Ϣ

	End Sub

	' ���ļ��������ļ���ͳһ������ĳ·����
	Public Sub SaveTo(path)
		
		Upload()	' �ϴ�

		if right(path,1) <> "/" then path = path & "/" 

		' �����������ϴ��ļ�
		For Each fileItem In Files.Items			
			fileItem.SaveAs path & fileItem.FileName
		Next


	End Sub

	' �����ϴ������ݣ������浽��Ӧ������
	Public Sub Upload ()

		Dim TotalBytes, Boundary
		TotalBytes = Request.TotalBytes	 ' �ܴ�С
		If TotalBytes < 1 Then
			Raise("�����ݴ���")
			Exit Sub
		End If
		If TotalBytes > MaxTotalBytes Then
			Raise("&#x60A8;&#x5F53;&#x524D;&#x4E0A;&#x4F20;&#x5927;&#x5C0F;&#x4E3A;" & TotalBytes/1000 & " K��&#x6700;&#x5927;&#x5141;&#x8BB8;&#x4E3A;" & MaxTotalBytes/1024 & "K<br/><anchor>&#x8FD4;&#x56DE;&#x4E0A;&#x4E00;&#x9875;<prev/></anchor><br/></p></card></wml>")
			Exit Sub
		End If
		Boundary = GetBoundary()
		If IsNull(Boundary) Then 
			Raise("&#x5982;&#x679C;form&#x4E2D;&#x6CA1;&#x6709;&#x5305;&#x62EC;multipart/form-data&#x4E0A;&#x4F20;&#x662F;&#x65E0;&#x6548;&#x7684;")
			Exit Sub	 ''���form��û�а���multipart/form-data�ϴ�����Ч��
		End If
		Boundary = StringToBinary(Boundary)
		

		Dim DataPart, PartSize
		BytesRead = 0

		'ѭ���ֿ��ȡ
		Do While BytesRead < TotalBytes

			'�ֿ��ȡ
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
			' ��ȡ����ͷ�Ľ���λ��
			PosEndOfHeader = InStrB(BoundaryStart + LenB(Boundary), Binary, StringToBinary(vbCrLf + vbCrLf))
						
			' �������ͷ��Ϣ�������ڣ�
			' Content-Disposition: form-data; name="file1"; filename="G:\homepage.txt"
			' Content-Type: text/plain
			Header = BinaryToString(MidB(Binary, BoundaryStart + LenB(Boundary) + 2, PosEndOfHeader - BoundaryStart - LenB(Boundary) - 2))

			' �����������
			bFieldContent = MidB(Binary, (PosEndOfHeader + 4), BoundaryEnd - (PosEndOfHeader + 4) - 2)
			
			FieldName = GetFieldName(Header)
			' ����Ǹ���
			If InStr (Header,"filename=""") > 0 Then
				Set File = New FileInfo
				
				' ��ȡ�ļ������Ϣ
				Dim clientPath
				clientPath = GetFileName(Header)
				File.FileName = GetFileNameByPath(clientPath)
				File.FileExt = GetFileExt(clientPath)
				File.FilePath = clientPath
				File.FileType = GetFileType(Header)
				File.FileStart = PosEndOfHeader + 3
				File.FileSize = BoundaryEnd - (PosEndOfHeader + 4) - 2
				File.FormName = FieldName

				' ������ļ���Ϊ�ղ������ڸñ������֮
				If Not Files.Exists(FieldName) And File.FileSize > 0 Then
					Files.Add FieldName, File
				End If
			'��������				
			Else
				' ����ͬ������
				If Form.Exists(FieldName) Then
					Form(FieldName) = Form(FieldName) & "," & BinaryToString(bFieldContent)
				Else
					Form.Add FieldName, BinaryToString(bFieldContent)
				End If
			End If

			' �Ƿ����λ��
			TwoCharsAfterEndBoundary = BinaryToString(MidB(Binary, BoundaryEnd + LenB(Boundary), 2))
			IsBoundaryEnd = TwoCharsAfterEndBoundary = "--"

			If Not IsBoundaryEnd Then ' ������ǽ�β, ������ȡ��һ��
				BoundaryStart = BoundaryEnd
				BoundaryEnd = InStrB(BoundaryStart + LenB(Boundary), Binary, Boundary)
			End If
		Loop
		

	End Sub

	'�쳣��Ϣ
	Private Sub Raise(Message)
		ErrMsg = ErrMsg & "[" & Now & "]" & Message
		
		
		'call Err.Raise(vbObjectError, "DoteyUpload", Message)

	End Sub

	' ȡ�߽�ֵ
	Private Function GetBoundary()
		Dim ContentType, ctArray, bArray
		ContentType = Request.ServerVariables("HTTP_CONTENT_TYPE")
		ctArray = Split(ContentType, ";")
		If Trim(ctArray(0)) = "multipart/form-data" Then
			bArray = Split(Trim(ctArray(1)), "=")
			GetBoundary = "--" & Trim(bArray(1))
		Else	'���form��û�а���multipart/form-data�ϴ�����Ч��
			GetBoundary = null
			Raise("&#x5982;&#x679C;form&#x4E2D;&#x6CA1;&#x6709;&#x5305;&#x62EC;multipart/form-data&#x4E0A;&#x4F20;&#x662F;&#x65E0;&#x6548;&#x7684;")
		End If
	End Function


	' ����������ת�����ı�
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



	' �ַ�����������
	Function StringToBinary(String)
		Dim I, B
		For I=1 to len(String)
			B = B & ChrB(Asc(Mid(String,I,1)))
		Next
		StringToBinary = B
	End Function



	'���ر�����
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


	'�����ļ���
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


	'�����ļ��� MIME type
	Private Function GetFileType(infoStr)
		sPos = InStr(infoStr, "Content-Type: ")
		GetFileType = Mid(infoStr, sPos + 14)
	End Function

	'����·����ȡ�ļ���
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

	'����·����ȡ��չ��
	Private Function GetFileExt(FullPath)
		Dim pos
		pos = InStrRev(FullPath,".")
		if pos>0 then GetFileExt = Mid(FullPath, Pos)
	End Function



End Class


'---------------------------------------------------
' �ļ���Ϣ ��
'---------------------------------------------------
Class FileInfo
	
	Dim FormName, FileName, FilePath, FileSize, FileType, FileStart, FileExt, NewFileName

	Private Sub Class_Initialize 
		FileName = ""		' �ļ���
		FilePath = ""			' �ͻ���·��
		FileSize = 0			' �ļ���С
		FileStart= 0			' �ļ���ʼλ��
		FormName = ""	' ������
		FileType = ""		' �ļ�Content Type
		FileExt = ""			' �ļ���չ��
		NewFileName = ""	'�ϴ����ļ���
	End Sub

	Public Function Save()
		SaveAs(FileName)
	End Function

	' �����ļ�
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

	' ����Binary
	Public Function GetBinary()
		Dim Binary
		If FileStart = 0 Then Exit Function

		DoteyUpload_SourceData.Position = FileStart
		Binary = DoteyUpload_SourceData.Read(FileSize)

		GetBinary = Binary
	End function

	' ȡ��������·��
	Private Function MapPath(Path)
		If InStr(1, Path, ":") > 0 Or Left(Path, 2) = "\\" Then
			MapPath = Path 
		Else 
			MapPath = Server.MapPath(Path)
		End If
	End function

	'����·����ȡ�ļ���
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