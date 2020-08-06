<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
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
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="修改保存位置">
<p>
文件保存位置现为<%=rsformPath%><b/><br/>
<input type="text" name="formPath" title="保存位置"  value="<%=rsformPath%>" size="20"/><br/>
保存上传文件的文件夹，无此文件夹将不能上传文件，第一次使用请先创建文件夹！<br/>
<anchor >创建文件夹<go href="wap_creatfloder.asp?adminmid=<%=request("adminmid")%>&amp;action=creat" method="post" >
<postfield name="formPath" value="$(formPath)"/>
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