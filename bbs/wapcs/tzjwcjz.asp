<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
dim Data_5xsoft

Class upload_5xsoft
  
dim objForm,objFile,Version

Public function Form(strForm)
   strForm=lcase(strForm)
   if not objForm.exists(strForm) then
     Form=""
   else
     Form=objForm(strForm)
   end if
 end function

Public function File(strFile)
   strFile=lcase(strFile)
   if not objFile.exists(strFile) then
     set File=new FileInfo
   else
     set File=objFile(strFile)
   end if
 end function


Private Sub Class_Initialize 
  dim RequestData,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,theFile
  dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
  dim iFindStart,iFindEnd
  dim iFormStart,iFormEnd,sFormName
  Version="9Cool.Net WEB上传程序 Version 2.0"
  set objForm=Server.CreateObject("Scripting.Dictionary")
  set objFile=Server.CreateObject("Scripting.Dictionary")
  if Request.TotalBytes<1 then Exit Sub
  set tStream = Server.CreateObject("adodb.stream")
  set Data_5xsoft = Server.CreateObject("adodb.stream")
  Data_5xsoft.Type = 1
  Data_5xsoft.Mode =3
  Data_5xsoft.Open
  Data_5xsoft.Write  Request.BinaryRead(Request.TotalBytes)
  Data_5xsoft.Position=0
  RequestData =Data_5xsoft.Read 

  iFormStart = 1
  iFormEnd = LenB(RequestData)
  vbCrlf = chrB(13) & chrB(10)
  sStart = MidB(RequestData,1, InStrB(iFormStart,RequestData,vbCrlf)-1)
  iStart = LenB (sStart)
  iFormStart=iFormStart+iStart+1
  while (iFormStart + 10) < iFormEnd 
	iInfoEnd = InStrB(iFormStart,RequestData,vbCrlf & vbCrlf)+3
	tStream.Type = 1
	tStream.Mode =3
	tStream.Open
	Data_5xsoft.Position = iFormStart
	Data_5xsoft.CopyTo tStream,iInfoEnd-iFormStart
	tStream.Position = 0
	tStream.Type = 2
	tStream.Charset ="utf-8"
	sInfo = tStream.ReadText
	tStream.Close
	'取得表单项目名称
	iFormStart = InStrB(iInfoEnd,RequestData,sStart)
	iFindStart = InStr(22,sInfo,"name=""",1)+6
	iFindEnd = InStr(iFindStart,sInfo,"""",1)
	sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
	'如果是文件
	if InStr (45,sInfo,"filename=""",1) > 0 then
		set theFile=new FileInfo
		'取得文件名
		iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
		iFindEnd = InStr(iFindStart,sInfo,"""",1)
		sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileName=getFileName(sFileName)
		theFile.FilePath=getFilePath(sFileName)
		'取得文件类型
		iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
		iFindEnd = InStr(iFindStart,sInfo,vbCr)
		theFile.FileType =Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileStart =iInfoEnd
		theFile.FileSize = iFormStart -iInfoEnd -3
		theFile.FormName=sFormName
		if not objFile.Exists(sFormName) then
		  objFile.add sFormName,theFile
		end if
	else
	'如果是表单项目
		tStream.Type =1
		tStream.Mode =3
		tStream.Open
		Data_5xsoft.Position = iInfoEnd 
		Data_5xsoft.CopyTo tStream,iFormStart-iInfoEnd-3
		tStream.Position = 0
		tStream.Type = 2
		tStream.Charset ="utf-8"
	        sFormValue = tStream.ReadText 
	        tStream.Close
		if objForm.Exists(sFormName) then
		  objForm(sFormName)=objForm(sFormName)&", "&sFormValue		  
		else
		  objForm.Add sFormName,sFormValue
		end if
	end if
	iFormStart=iFormStart+iStart+1
	wend
  RequestData=""
  set tStream =nothing
End Sub

Private Sub Class_Terminate  
 if Request.TotalBytes>0 then
	objForm.RemoveAll
	objFile.RemoveAll
	set objForm=nothing
	set objFile=nothing
	Data_5xsoft.Close
	set Data_5xsoft =nothing
 end if
End Sub
   
 
 Private function GetFilePath(FullPath)
  If FullPath <> "" Then
   GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
  Else
   GetFilePath = ""
  End If
 End  function
 
 Private function GetFileName(FullPath)
  If FullPath <> "" Then
   GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
  Else
   GetFileName = ""
  End If
 End  function
End Class

Class FileInfo
  dim FormName,FileName,FilePath,FileSize,FileType,FileStart
  Private Sub Class_Initialize 
    FileName = ""
    FilePath = ""
    FileSize = 0
    FileStart= 0
    FormName = ""
    FileType = ""
  End Sub
  
 Public function SaveAs(FullPath)
    dim dr,ErrorChar,i
    SaveAs=true
    if trim(fullpath)="" or FileStart=0 or FileName="" or right(fullpath,1)="/" then exit function
    set dr=CreateObject("Adodb.Stream")
    dr.Mode=3
    dr.Type=1
    dr.Open
    Data_5xsoft.position=FileStart
    Data_5xsoft.copyto dr,FileSize
    dr.SaveToFile FullPath,2
    dr.Close
    set dr=nothing 
    SaveAs=false
  end function
  End Class
</SCRIPT>
<!--#include FILE="conn.asp"-->
<!--#include FILE="ltinc/char.asp"-->
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
ids=request("ids")
iduse=Session("useid")
page=request("page")
explain="附件续传"
title="附件续传"
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")         '上传路径
rsnamekind=rs1("namekind")         '命名方式
rsfilesize=rs1("filesize")         '文件大小
rsallowedfile=rs1("allowedfile")   '文件类型
rsforceup=rs1("forceup")           '上传开关
rs1.close
Set rs1=Nothing
If Right(rsformPath,1)<>"\" Then rsformPath=rsformPath&"\"
%>
<%
dim upload,photo,formName,formPath,iCount
Dim sjs,fname,i,l,newfilelist,uploaddir,filename,ii
''--------------------------
Server.ScriptTimeOut=999999
set upload=new upload_5xsoft 
''---------------------------获得变量值
fullpath=Server.Mappath("\")&"\"
addip=request.serverVariables("remote_host")
''--------------------------保存路径
formPath=rsformPath
fullpath=fullpath&rsformPath
On Error Resume Next 
Set fso = CreateObject("Scripting.FileSystemObject")
Set fldr = fso.GetFolder(fullpath)
If err<>0 Then response.Redirect"/bbs/wapcs/errs.asp?id=6&ForumID="&ForumID&"&ids="&ids&"&page="&page&"&yxxeID=8868&SessionID="&SessionID&""
''--------------------------
iCount=0
for each formName in upload.objFile ''列出所有上传了的文件
set file=upload.file(formName) ''生成一个文件对象
size=file.filesize
''-------------------------限制文件大小
If size>rsfilesize*1024 Then response.Redirect"/bbs/wapcs/errs.asp?id=3&ForumID="&ForumID&"&ids="&ids&"&page="&page&"&yxxeID=8868&SessionID="&SessionID&""
If  size=0  Then response.Redirect"/bbs/wapcs/errs.asp?id=5&ForumID="&ForumID&"&ids="&ids&"&page="&page&"&yxxeID=8868&SessionID="&SessionID&""
''-------------------------获得文件类型
filetype=file.filename
i=InStrRev(filetype,".")
l=Len(filetype)
If i>0 Then
  filetype=Right(filetype,l-i+1)
End If
''-------------------------限制文件类型
filetype=LCase(filetype)
filetype=Replace(filetype,".","")
filetype=CStr(filetype)
If  InStr(rsallowedfile,filetype)=0  Then response.Redirect"/bbs/wapcs/errs.asp?id=2&ForumID="&ForumID&"&ids="&ids&"&page="&page&"&yxxeID=8868&SessionID="&SessionID&""
''----------------取得新文件名
If rsnamekind=1 Then
fname=file.filename
Else
RANDOMIZE
ranNum = int(9*10^3*rnd)+10^3
dtNow = Now()
FileName ="ky_" & year(dtNow) & right("0" & month(dtNow),2) & right("0" & day(dtNow),2) &"_"& right("0" & hour(dtNow),2) & right("0" & minute(dtNow),2) & right("0" & second(dtNow),2) &"_"& ranNum 
fname=FileName&"."&filetype
End if
''-------------------------检验文件是否存在
rsforceup="t"
If rsforceup="F" then
sq1="select * from data where filesize='"&size&"'"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
If Not rs1.bof Or Not rs1.eof Then response.Redirect"/bbs/wapcs/errs.asp?id=4&size="&size&"&ForumID="&ForumID&"&ids="&ids&"&page="&page&"&yxxeID=8868&SessionID="&SessionID&""
Else
sq1="select * from data where filesize='"&size&"'"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
End If
''--------------------------
if file.filesize>0 then         ''如果 FileSize > 0 说明有文件数据
file.SaveAs fullpath&fname ''保存文件
iCount=iCount+1
msg="文件上传成功！"
End  If
IswNumsIPs = Request.ServerVariables("REMOTE_ADDR") 
If IswNumsIPs ="" Then IswNumsIPs = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 

datadir=formPath&fname
addtime=date()
rs1.addnew
rs1("dataname")=fname
rs1("title")=title
rs1("explain")=explain
rs1("datadir")=datadir
rs1("addtime")=addtime
rs1("filesize")=size
rs1("IswNumsIP")=IswNumsIPs
rs1("ids")=iduse
rs1.update
rs1.close
set file=nothing
next
set upload=nothing  '删除此对象
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="文件上传成功"><p>
<%
size=CStr(size)
sq2="select * from data where filesize='"&size&"' order by id desc"
Set Rs2 = Server.CreateObject("Adodb.Recordset")
rs2.open sq2,conn,1,2
id=rs2("id")
title=rs2("title")
explain=rs2("explain")
size=rs2("filesize")
addtime=rs2("addtime")
url=rs2("dataname")
%>
<%
filetype=rs2("dataname")
i=InStrRev(filetype,".")
l=Len(filetype)
If i>0 Then
  filetype=Right(filetype,l-i)
End If%>
文件上传成功<br/>-----------<br/>
文件格式:<%=filetype%><br/>
<%size=Round(rs2("filesize")/1024,2)
If Left(size,1)="." Then size="0"&size%>
文件大小:<%=size%>KB<br/>
文件地址:<%=url%><br/>
<%
jpg="jpg"
gif="gif"
png="png"
bmp="bmp"
jpeg="jpeg"

if filetype<>jpg and filetype<>gif and filetype<>jpeg and filetype<>bmp and filetype<>png then
ky="r"
wjss="(url=/bbs/wapcs/upload/"&rs2("dataname")&")免费下载(/url)\"
else
ky="k"
wjss="(img)/bbs/wapcs/upload/"&rs2("dataname")&"(/img)"
end if

youmdb="/admin/Database/#qqccb.mdb" '您社区数据库地址
set conn=Createobject("ADODB.Connection")
conn.ConnectionString="DBQ="& server.mappath(youmdb)& ";DRIVER={Microsoft Access Driver (*.mdb)};"
conn.open
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

%>
-----------<br/>
是否补充帖子内容(可留空)
<br/><input type="text" name="explain<%=minute(now)%><%=second(now)%>" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/><anchor>确定续传
<go method="post" href='/BBS/forum_content/wzjscl.asp?ForumID=<%=ForumID %>&amp;SessionID=<%=SessionID%>'>
<postfield name="memo" value="\<%=wjss%>[格式:<%=filetype%>,大小:<%=size%>KB]\$(explain<%=minute(now)%><%=second(now)%>)"/>
<postfield name='pic' value='<%=ky%>'/>
<postfield name='lzdname' value='d'/>
<postfield name='id' value='<%=ids%>'/>
<postfield name='page' value='<%=page%>'/>
</go></anchor><br/>
<%
rs2.close
Set rs2=nothing%>
-----------<br/>
<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=IDs%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回查看帖子</a><br/>
<%
Response.write "<a href='/BBS/forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
%>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>
<%
conn.close
Set conn=nothing%>
