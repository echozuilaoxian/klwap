<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="向友友发起挑战记录">
<p>
选择查看类型:<br/>
<a href='mylb2.asp?SessionID=<%=SessionID%>'>猜  大  小 </a><br/>
<a href='mylb.asp?SessionID=<%=SessionID%>'>剪刀石头布</a><br/>   
-----------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>竞技中心</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
</p>
</card>
</wml>