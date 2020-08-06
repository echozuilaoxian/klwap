<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
%>
<card id="main" title="重返校园">
<p align="left">
你是否想再入学?考虑清楚啊,不然拿到积分后,又让扣除!<br/>
<a href='/bbs/school/cd.asp?id=<%=iduse%>&amp;SessionID=<%=SessionID%>'>是的,已经考虑好了!</a><br/>
<a href="/bbs/school/school.asp?SessionID=<%=SessionID%>">没这个意思!</a><br/>
---------<br/>
<%
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
%>