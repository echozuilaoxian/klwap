<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
%>
<card id="main" title="确定退出">
<p align="left">
你是否要辞职?<br/>
如果是,所有属性都会减一半!金币-1000枚<br/>
<a href='/bbs/job/enttc.asp?id=<%=iduse%>&amp;SessionID=<%=SessionID%>'>确定</a><br/>
<a href="/bbs/job/ent.asp?SessionID=<%=SessionID%>">取消</a>
<br/>-------------<br/>
<%
Response.write "<a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>