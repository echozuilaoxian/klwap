<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="文件管理" >
<p align="left"><img src="/IMG/4.gif" alt='修改帐号'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%>
<br/>---------<br/>
<a href="wjclass.asp?sid=<%=sid%>">[分类管理]</a> <br/>
<a href="tjwj.asp?sid=<%=sid%>">[添加分类]</a> <br/>
<a href="up.asp?sid=<%=sid%>">[上传文件]</a> <br/>
<a href="get.asp?sid=<%=sid%>">[采集文件]</a> <br/>
<a href="adminpin.asp?sid=<%=sid%>">[评论管理]</a><br/>
<a href="wjsq.asp?sid=<%=sid%>">[上传设置]</a> <br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>