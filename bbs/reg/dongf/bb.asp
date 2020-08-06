<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<card id='card1' title='BB形象'><p>
默认形象:<br/>
<img src='/bbs/reg/dongf/bb.gif' alt='加载中..'/><br/>
形象1:<br/>
<img src='/bbs/reg/dongf/bb1.gif' alt='加载中..'/><br/>
形象2:<br/>
<img src='/bbs/reg/dongf/bb2.gif' alt='加载中..'/><br/>
形象3:<br/>
<img src='/bbs/reg/dongf/bb3.gif' alt='加载中..'/><br/>
形象4:<br/>
<img src='/bbs/reg/dongf/bb4.gif' alt='加载中..'/><br/>
形象5:<br/>
<img src='/bbs/reg/dongf/bb5.gif' alt='加载中..'/><br/>
形象6:<br/>
<img src='/bbs/reg/dongf/bb6.gif' alt='加载中..'/><br/>
形象7:<br/>
<img src='/bbs/reg/dongf/bb7.gif' alt='加载中..'/><br/>
形象8:<br/>
<img src='/bbs/reg/dongf/bb8.gif' alt='加载中..'/><br/>
------------<br/><a href='/bbs/reg/dongf/jcj/bbgm.asp?SessionID=<%=SessionID%>'>返回修改资料</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>