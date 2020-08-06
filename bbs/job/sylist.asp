<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="商业广场-各级属性">
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
本职业共分为10个等级.点击可以查看每级所需要的条件
<br/>-------------
<br/><a href='sylist1.asp?n=1&amp;SessionID=<%=SessionID%>'>1.收发室职员</a>
<br/><a href='sylist1.asp?n=2&amp;SessionID=<%=SessionID%>'>2.行政助理</a>
<br/><a href='sylist1.asp?n=3&amp;SessionID=<%=SessionID%>'>3.区域推销员</a>
<br/><a href='sylist1.asp?n=4&amp;SessionID=<%=SessionID%>'>4.低级主管</a>
<br/><a href='sylist1.asp?n=5&amp;SessionID=<%=SessionID%>'>5.项目经理</a>
<br/><a href='sylist1.asp?n=6&amp;SessionID=<%=SessionID%>'>6.高级经理</a>
<br/><a href='sylist1.asp?n=7&amp;SessionID=<%=SessionID%>'>7.业务总监</a>
<br/><a href='sylist1.asp?n=8&amp;SessionID=<%=SessionID%>'>8.副总裁</a>
<br/><a href='sylist1.asp?n=9&amp;SessionID=<%=SessionID%>'>9.首席执行官</a>
<br/><a href='sylist1.asp?n=10&amp;SessionID=<%=SessionID%>'>10.商业大亨</a>
<% 
Response.write "<br/>-------------<br/><a href='/bbs/job/sy.asp?SessionID="&SessionID&"'>返回商场广场</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
%>