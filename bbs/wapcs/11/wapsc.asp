<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include FILE="ltinc/upload.inc"-->
<!--#include FILE="conn.asp"-->
<!--#include FILE="ltinc/char.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
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
usename=upload.form("usename")
mess=upload.form("mess")
If  usename=""  Then response.Redirect"/bbs/wapcs/err.asp?id=1&SessionID="&SessionID&""
''--------------------------保存路径
formPath=rsformPath
fullpath=fullpath&rsformPath
On Error Resume Next 
Set fso = CreateObject("Scripting.FileSystemObject")
Set fldr = fso.GetFolder(fullpath)
If err<>0 Then response.Redirect"/bbs/wapcs/err.asp?id=6&SessionID="&SessionID&""
''--------------------------
iCount=0
for each formName in upload.objFile ''列出所有上传了的文件
set file=upload.file(formName) ''生成一个文件对象
size=file.filesize
''-------------------------限制文件大小
If size>rsfilesize*1024 Then response.Redirect"err.asp?id=3&SessionID="&SessionID&""
If  size<=0  Then response.Redirect"/bbs/wapcs/showsofs.asp?SessionID="&SessionID&""
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
If  InStr(rsallowedfile,filetype)=0  Then response.Redirect"/bbs/wapcs/err.asp?id=2&SessionID="&SessionID&""
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
If rsforceup="F" then
sq1="select * from data where filesize='"&size&"'"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
If Not rs1.bof Or Not rs1.eof Then response.Redirect"/bbs/wapcs/err.asp?id=4&size="&size&"&SessionID="&SessionID&""
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
rs1("title")=upload.form("usename") 
rs1("explain")=upload.form("mess") 
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
<%
  response.write "<card id='card1' title='文件上传成功' ontimer='/bbs/wapcs/showsofs.asp?SessionID="&SessionID&"'><timer value='5'/><p align='left'>"
  response.write "文件上传成功!<br/>正在进入文件列表...<br/>"
  response.write "<a href='/bbs/wapcs/showsofs.asp?SessionID="&SessionID&"'>[文件列表]</a>"
  response.write "<br/><a href='/bbs/myalbum/index.asp?SessionID="&SessionID&"'>[网友相册]</a>"
  response.write "<br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>[社区首页]</a></p></card></wml>"
%>