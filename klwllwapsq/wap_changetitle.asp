<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rstitle=rs1("title")
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rsforceup=rs1("forceup")
rs1.close
Set rs1=nothing
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="修改首页标题">
<p align="center"><%=rstitle%></p>
<p>
<input type="text" name="title" title="首页标题"  value="<%=rstitle%>" size="20"/><br/>
显示在首页的标题,如上所示。<br/>
<anchor >修改<go href="wap_change_save.asp?adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="title" value="$(title)"/>
</go>
</anchor><br/>
-----------------<br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>