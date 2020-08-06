<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="发起挑战">
<p>
<% 
wap=request.querystring("wap") 
Server.ScriptTimeout=999
iduse=Session("useid")
gfdsa=Session("ltname")
%>
选择挑战类型:<br/>
<a href='/bbs/tz/tz2.asp?'>猜 大 小</a><br/>
<a href='/bbs/tz/tz.asp?'>剪刀石头布</a><br/>
-----------<br/>
<a href='/bbs/tz/index.asp?wap=<%=wap%>'>[竞技中心]</a><br/>    
<a href="/bbs/index.asp?wap=<%=wap%>">[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
报时:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%>
<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>