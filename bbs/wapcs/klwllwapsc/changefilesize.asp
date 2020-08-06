<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<!--#include FILE="char.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rstitle=c2u(rs1("title"))
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rsforceup=rs1("forceup")
rs1.close
Set rs1=nothing
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="修改文件大小">
<p>
上传文件限制大小现为<%=rsfilesize%>KB<b/><br/>
<input type="text" name="filesize" title="文件大小"  value="<%=rsfilesize%>" size="4"/>KB<br/>
限制上传文件的大小，部分空间有200KB的限制，大于200KB将不能上传成功。<br/>
<anchor >修改<go href="change_save.asp?adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="filesize" value="$(filesize)"/>
</go>
</anchor><br/>
-----------------<br/>
<a href="admin.asp?adminmid=<%=request("adminmid")%>">返回首页</a><br/>
<a href="index.asp">退出管理</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>