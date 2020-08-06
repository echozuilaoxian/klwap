<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=UTF-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.net/DTD/wml_1.1.xml"> 
<wml>
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="数据库管理"><p>
<%
dim filepath
filepath=Server.MapPath("/")'文件目录
if  request.QueryString("act") = "del" Then
Dim fsod,Filedel
Filedel=filepath&"/"&request.QueryString("file")
set fsod = createobject("scripting.filesystemobject")
if (fsod.fileexists(Filedel)) then 
fsod.deletefile(Filedel)
end if
set fsod = Nothing
response.redirect "filesjk.asp?sid="&SID&""
End If
Dim fs, f, f1, fc,cs,i
i=0 
Set fs = CreateObject("Scripting.FileSystemObject") 
Set f = fs.GetFolder(filepath) 
Set fc = f.Files 
For Each f1 in fc 
response.write  "<a href=""/"&f1.name&""">下载</a>"
response.write  " | <a href=""?sid="&SID&"&amp;act=del&amp;file="&f1.name&""">删除</a><br/>"
response.write ""&f1.name&"<br/>"
i=i+1
Next
response.write  "当前共有"&i-2&"个备份文件！<br/>"
response.write  "注意:当前使用的数据库不能删除,指定删除也会失败<br/>"
response.write  "<a href=""mdb.asp?sid="&SID&""">[数据管理]</a><br/>"
response.write  "<a href=""index.asp?sid="&SID&""">[后台管理]</a>"
Response.Write "</p></card></wml>"
%>