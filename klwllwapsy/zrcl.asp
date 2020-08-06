<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn.asp" -->
<!-- #include file="admin.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="注入高级管理" >
<p align="left">
管理区域:<%=Request.ServerVariables("SERVER_NAME")%><br/>
管理IP:<%=Request.ServerVariables("REMOTE_ADDR")%>
<br/>---------<br/>
<%
response.write " 设置允许注入次数(0次为一次也不让注入)<br/>"  
response.write " <input name=""ipzrcs"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""4""/>次<a href=""zrip.asp?Action=ipzrs&amp;sid="&sid&"&amp;ipzrcs=$(ipzrcs)"">确定</a><br/>"  
%>
<a href="zrip.asp?sid=<%=sid%>">[注入封锁]</a> <br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>