<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="修改标题" ontimer="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">
<timer name ="goback"  value="1"/>
<%
title=request("title")
filesize=request("filesize")
allowedfile=request("allowedfile")
allowedfilm=request("allowedfilm")
allowedfils=request("allowedfils")
allowedfilr=request("allowedfilr")
allowedfilb=request("allowedfilb")
namekind=request("namekind")
formPath=request("formPath")
forceup=request("forceup")
password=request("password")
if session("Adminid")="1" then
sq1="select * from upset where id=1"
Set Rs = Server.CreateObject("Adodb.Recordset")
rs.open sq1,conn,1,2
If title<>"" Then rs("title")=title
If filesize<>"" Then rs("filesize")=filesize
If allowedfile<>"" Then rs("allowedfile")=allowedfile
If allowedfilm<>"" Then rs("allowedfilm")=allowedfilm
If allowedfils<>"" Then rs("allowedfils")=allowedfils
If allowedfilr<>"" Then rs("allowedfilr")=allowedfilr
If allowedfilb<>"" Then rs("allowedfilb")=allowedfilb
If namekind<>"" Then rs("namekind")=namekind
If formPath<>"" Then rs("formPath")=formPath
If forceup<>"" Then rs("forceup")=forceup
If password<>"" Then rs("password")=password
rs.update
rs.close
Set rs=Nothing
%>
<%If formPath<>"" And request("action")="creat" Then
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")
rs1.close
Set rs1=Nothing
path=Server.Mappath("\")&"\"&rsformPath
On Error Resume Next 
Set fso = CreateObject("Scripting.FileSystemObject")
Set tempcreatfloder=fso.CreateFolder (path)
set tempcreatfloder=Nothing
response.redirect"creatfloder.asp?adminmid="&request("adminmid")&""
End if

End if%>

<p>
操作成功！<br/>正在<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回</a>...
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>