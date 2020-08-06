<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
  iduse=Session("useid")
  itid=request("itid")
%>
<card title="清空捐款记录">
<p align="left">
删除后不可恢复.你确定删除?<br/><br/>
<a href="delok.asp?itid=<% =itid %>&amp;wap=<%=wap%>">[-确定-]</a><br/><a href="1.asp?itid=<% =itid %>&amp;wap=<%=wap%>">[-取消-]</a>
<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>