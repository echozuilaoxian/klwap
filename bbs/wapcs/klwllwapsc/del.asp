<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<!--#include FILE="char.asp"-->
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="删除文件">
<p>
将从空间及数据库里删除此文件，删除后不可恢复，确定删除吗？<br/>
<a href="showsoft.asp?adminmid=<%=request("adminmid")%>">返回</a>
<a href="del2.asp?id=<%=request("id")%>&amp;adminmid=<%=request("adminmid")%>">确定</a><br/>
-------------<br/>
<a href="showsoft.asp?adminmid=<%=request("adminmid")%>">返回上页</a><br/>
<a href="index.asp">退出管理</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>