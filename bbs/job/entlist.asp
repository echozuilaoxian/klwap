<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="娱乐圈-岗位详情">
<p align="left">
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
娱乐圈,本职业共分为10个等级.点击可以查看每级所需要的条件.
<br/>---------
<br/><a href='entlist1.asp?n=1&amp;SessionID=<%=SessionID%>'>1.侍者</a>
<br/><a href='entlist1.asp?n=2&amp;SessionID=<%=SessionID%>'>2.群众演员</a>
<br/><a href='entlist1.asp?n=3&amp;SessionID=<%=SessionID%>'>3.跑龙套演员</a>
<br/><a href='entlist1.asp?n=4&amp;SessionID=<%=SessionID%>'>4.主角替身</a>
<br/><a href='entlist1.asp?n=5&amp;SessionID=<%=SessionID%>'>5.新人影星</a>
<br/><a href='entlist1.asp?n=6&amp;SessionID=<%=SessionID%>'>6.一般影星</a>
<br/><a href='entlist1.asp?n=7&amp;SessionID=<%=SessionID%>'>7.电视名星</a>
<br/><a href='entlist1.asp?n=8&amp;SessionID=<%=SessionID%>'>8.影视大腕</a>
<br/><a href='entlist1.asp?n=9&amp;SessionID=<%=SessionID%>'>9.演艺明星</a>
<br/><a href='entlist1.asp?n=10&amp;SessionID=<%=SessionID%>'>10.超级巨星</a>
<%
Response.write "<br/>------------<br/><a href='/bbs/job/phe.asp?SessionID="&SessionID&"'>返回单位排行</a>"
Response.write "<br/><a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
%>