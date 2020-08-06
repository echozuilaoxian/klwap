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
<card id="main" title="文章管理" >
<p align="left"><img src="/IMG/5.gif" alt='文章栏目'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%>
<br/>---------<br/>
<a href="wzclass.asp?sid=<%=sid%>">[栏目管理]</a> <br/>
<a href="tjwz.asp?sid=<%=sid%>">[添加栏目]</a> <br/>
<a href="adminpl.asp?sid=<%=sid%>">[评论管理]</a><br/>
<a href="wzsq.asp?sid=<%=sid%>">[上传开关]</a> <br/>
<a href="wzpb.asp?sid=<%=sid%>">[屏蔽管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>