<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="搜索自建聊室">
<p align='left'>

搜索方式:<br/>
<select name="t" value="1">
<option value="1">聊室名称</option>
<option value="2">聊室ID号</option>
</select><br/>
输入关键字
<br/><input name="about" maxlength="50" title="搜索关键字"/>
<br/>
<br/><anchor>搜 索
<go method="post" href="findcl.asp?SessionID=<%=SessionID%>">
<postfield name="t" value="$(t)"/>
<postfield name="about" value="$(about)"/>
</go>
</anchor>


<br/>--------<br/>
<a href="set.asp?SessionID=<%=SessionID%>">开设聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>