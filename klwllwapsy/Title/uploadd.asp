﻿<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<!--#include file="upload.inc"-->
<%
dim lid,id
cid=request.querystring("cid")
id=request.querystring("id")

			set rs=server.CreateObject("adodb.recordset")
			sql="select * from twapp"
			rs.open sql,conn,1,1

bbsid=request.querystring("bbsid")
up=request.querystring("up")
Server.ScriptTimeOut=9999999
AllowFileType= ""&rs("format")&""	'允许上传的文件类型，用“,”隔开
AllowFileSize=""&rs("size")&""	'最大上传文件，以KB为单位
Const G_FS_FSO = "Scripting.FileSystemObject"
'---------------------------------------------------------------------------
Dim Create_DateCatalog
	Create_DateCatalog = False
'---------------------------------------------------------------------------
Dim AutoReName,UpFileObj,FileObject,FormName,FileName,FileExtStr,strFileName
Dim Fso,SavePath,AutoSavePath,AppearErr,ClueOn_Msg,StrJs
Dim SameFileTF,No_UpFileTF,RealityPath
'---------------------------------------------------------------------------
SavePath = "/upfile/"
If Right(SavePath,1) <> "/" Then
	SavePath = SavePath & "/"
End If

Set UpFileObj = New UpFile_Class
UpFileObj.GetData(10240000)

AutoReName = "2"
'Trim(UpFileObj.Form("AutoRename"))
ClueOn_Msg = ""
No_UpFileTF = True
AppearErr = False
If IsObjInstalled(G_FS_FSO) = True Then
'---------------------------------------------------------------------------
Set Fso = Server.CreateObject(G_FS_FSO)
'---------------------------------------------------------------------------
	For Each FormName in UpFileObj.File
	
		Set FileObject = UpFileObj.File(FormName)
		SameFileTF = False
		FileName = FileObject.FileName
		If NoIiiegalStr(FileName) = False Then
			ClueOn_Msg = "上传被禁止！"
			AppearErr = True
			UpFileError
		End If
		
		FileExtStr = FileObject.FileExt

		If FileObject.FileSize > 1 Then
'----------------------------------------------------------------------------
			If Fso.FolderExists(Server.MapPath(SavePath)) = True Then
				If Create_DateCatalog = True Then
					AutoSavePath = Year(Now()) & Right("0" & Month(Now()),2) & "/"
					SavePath = SavePath & AutoSavePath
							
					If Not Fso.FolderExists(Server.MapPath(SavePath)) Then
						Fso.CreateFolder Server.MapPath(SavePath)
					End If
				End If
			Else
				ClueOn_Msg = "目录不存在,无法上传文件！"
				AppearErr = True
				UpFileError
			End If
			RealityPath = Server.MapPath(SavePath) & "\"
'-----------------------------------------------------------------------------
			No_UpFileTF = False
			If FileObject.FileSize > Clng(AllowFileSize)*1024 Then
				ClueOn_Msg = "文件"&FileName&"超过了限制！<br/>最大只能上传" & AllowFileSize & "K的文件"
				AppearErr = True
				UpFileError
			End If
			
			IF AutoRename = "1" Then
				If Fso.FileExists(RealityPath & FileName) = True Then
					ClueOn_Msg = "文件已存在！"
					AppearErr = True
				Else
					SameFileTF = False
				End If
			Else
				SameFileTF = True
			End If
  FileName = Replace(FileName,"jpeg","jpg")
  FileName = Replace(FileName,"sisx","sis")
			If CheckFileType(AllowFileType,FileName) = False Then
				ClueOn_Msg = "此文件不允许上传！<br/>"&vbCrLf&"允许上传文件类型有"& AllowFileType
				AppearErr = True
				UpFileError
			End If

			If AppearErr <> True Then	
				If SameFileTF = True Then
					strFileName = DateStr & rndStr(5) & "." & DealExtName(FileExtStr)
				Else
					strFileName = ReplaceExt(FileName,"shit")
				End If
				FileObject.SaveToFile Server.MapPath(SavePath & strFileName)
				ClueOn_Msg = "已完成上传！<br/>"
				Dim SaveFileType,SaveFileName,SaveFilePath,SaveFileSize,FileDescriptions

				SaveFilePath=Replace(SavePath&strFileName,"\","/")
				SaveFileSize=Formatnumber(FileObject.FileSize/1024,2,-1,-1,0)
				FileDescriptions=UpFileObj.Form("Descriptions")
				ClueOn_Msg=ClueOn_Msg&vbCrLf&"请返回<br/>"&vbCrLf



		set rs1=server.CreateObject("adodb.recordset")
		sql1="select * from sms where id="&cid
		rs1.open sql1,conn,1,3
		if not (rs1.bof and rs1.eof)  then 
		end if
		Rs1("pic")=SaveFilePath
		Rs1.Update
		Rs1.close
		Set Rs1=nothing



				UpFilesuccess
			End If
		Else
			ClueOn_Msg = "请选择你要上传的文件！"
			UpFileError
		End If
	Next
	Set FileObject = Nothing
Set Fso = Nothing
Else
	ClueOn_Msg = "上传功能需要FSO组件支持,请检查该组件是否安装正确!"
	UpFileError
End If
Set UpFileObj = Nothing

'//验证上传文件的合法性
Function CheckFileType(AllowFileType,FileExtStr)
	Dim i,AllowArray,AllowCount,FileExtName
	AllowArray=Split(AllowFileType,",")
	AllowCount=Ubound(AllowArray)
	FileExtName=Right(FileName,3)
	IF AllowCount>0 Then
		For i = LBound(AllowArray) to UBound(AllowArray)
		IF LCase(AllowArray(i))=LCase(FileExtName) Then
			CheckFileType=True
			Exit For
		End IF
		Next
	End IF
	IF FileExtName="asp" or FileExtName="asa" or FileExtName="aspx" or FileExtName="cer" or FileExtName="php" or FileExtName="cdx" or FileExtName="htr" or FileExtName="exe" Then
		CheckFileType = False
	End If
End Function

'//检查文件名格式
Function NoIiiegalStr(Byval FileNameStr)
	Dim Str_Len,Str_Pos
	Str_Len = Len(FileNameStr)
	Str_Pos = InStr(FileNameStr,Chr(0))
	If Str_Pos = 0 or Str_Pos = Str_Len then
	 	NoIiiegalStr = True
	Else
	 	NoIiiegalStr = False
	End If
End function

'//替换掉禁止的文件类型
Function DealExtName(Byval UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	DealExtName = Lcase(UpFileExt)
	DealExtName = Replace(DealExtName,Chr(0),"")
	DealExtName = Replace(DealExtName," ","")
	DealExtName = Replace(DealExtName,"　","")
	DealExtName = Replace(DealExtName,Chr(255),"")
	DealExtName = Replace(DealExtName,".","")
	DealExtName = Replace(DealExtName,"'","")
	DealExtName = Replace(DealExtName,"asp","")
	DealExtName = Replace(DealExtName,"asa","")
	DealExtName = Replace(DealExtName,"aspx","")
	DealExtName = Replace(DealExtName,"cer","")
	DealExtName = Replace(DealExtName,"cdx","")
	DealExtName = Replace(DealExtName,"htr","")
	DealExtName = Replace(DealExtName,"php","")
	DealExtName = Replace(DealExtName,"exe","")
End Function

'//如果不开启自动命名,则执行替换
'//替换非法文件为自定义字符串
Function ReplaceExt(Byval ExtStr,Byval RepExt)
	If IsEmpty(ExtStr) or IsEmpty(RepExt) Then Exit Function
	ReplaceExt = Lcase(ExtStr)
	ReplaceExt = Replace(ReplaceExt,Chr(0),"")
	ReplaceExt = Replace(ReplaceExt," ","")
	ReplaceExt = Replace(ReplaceExt,"　","")
	ReplaceExt = Replace(ReplaceExt,Chr(255),"")
	ReplaceExt = Replace(ReplaceExt,"'","")
	ReplaceExt = Replace(Replace(ReplaceExt,"asp",RepExt),".asp","sp" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"asa",RepExt),".asa","sa" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"aspx",RepExt),".aspx","spx" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"cer",RepExt),".cer","er" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"cdx",RepExt),".cdx","dx" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"htr",RepExt),".htr","tr" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"php",RepExt),".php","hp" & RepExt)
	ReplaceExt = Replace(Replace(ReplaceExt,"exe",RepExt),".exe","xe" & RepExt)
End Function

'//产生一个日期字符串
Function DateStr()
	Dim iYear,iMonth,iDay,iHour,iMinute,iScond
	iYear = Year(Now)
	iMonth = Month(Now)
	iDay = Day(Now)
	iHour = CStr(Hour(Now()))
	If Len(iHour) = 1 Then
		iHour = "0" & iHour
	End If
	
	iMinute = CStr(Minute(Now()))
	If Len(iMinute) = 1 Then
		iMinute = "0" & iMinute
	End If

	iScond = CStr(Second(Now()))
	If Len(iScond) = 1 Then
		iScond = "0" & iScond
	End If
	DateStr = iYear & iMonth & iDay & iHour & iMinute & iScond
End Function

'//生成指定位数的字符
Function rndStr(strLong)
	Dim tempStr
	Randomize
	Do while Len(rndStr) < strLong
		tempStr = CStr(Chr((57-48)*rnd+48))
		rndStr = rndStr & tempStr
	Loop
		rndStr = rndStr
End Function

'//检查组件是否安装
Function IsObjInstalled(ByVal strClassString)
	Dim xTestObj,ClsString
		On Error Resume Next
	IsObjInstalled = False
		ClsString = strClassString
		Err = 0
		Set xTestObj = Server.CreateObject(ClsString)
	If Err = 0 Then IsObjInstalled = True
		If Err = -2147352567 Then IsObjInstalled = True
			Set xTestObj = Nothing
		Err = 0
	Exit Function
End Function
%>

<%Sub UpFileError()%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传文件</title>
</head>
<body>
<%=ClueOn_Msg%><br/>
			<a href="upfile.asp?sid=<%=sid%>&amp;id=<%=id%>">[继续上传]</a><br/>
		<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</body>
</html><%Response.End%><%End Sub%>

<%Sub UpFileSuccess()%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传文件</title>
</head>
<body>
<%=ClueOn_Msg%><br/>
			<a href="upfile.asp?sid=<%=sid%>&amp;id=<%=id%>">[继续上传]</a><br/>
		<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</body>
</html><%Response.End%><%End Sub%>