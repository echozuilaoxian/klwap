<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="md5.asp"-->
<%
If request("action")="login" then
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
password=rs1("password")
rs1.close
Set rs1=Nothing
adminmid=md5(password&"whpku.net")
If password=request("password") Then 
response.redirect"admin.asp?adminmid="&adminmid&""
Else
mess="密码错误！<br/>"
End if
End if
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="系统管理">
<p align="center">
<%=mess%>
请输入密码<br/>
<input type="text" format="*N" name="password" title="管理密码"  value="" size="9"/><br/>
<a href="index.asp?password=$password&amp;action=login">登陆</a><br/>
<a href="../">返回</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>