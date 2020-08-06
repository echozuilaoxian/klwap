<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
%>
<card id="main" title="我要退学">
<p align="left">
你是否要退学?<br/>
退学的问题比较严重,如果退学了,学分为0,而且不能参加部分工作!请慎重考虑!<br/>
<a href='/bbs/school/tx.asp?id=<%=iduse%>&amp;SessionID=<%=SessionID%>'>是</a><br/>
<a href="/bbs/school/school.asp?SessionID=<%=SessionID%>">否</a><br/>
<%
Response.write "------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set conn=nothing
%>
