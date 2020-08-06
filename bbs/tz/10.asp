<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<%
dim id
id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发起挑战">
<p> 
<%
Response.write"<a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>查看对方资料</a>"
%>

<br/>
选择挑战类型:<br/>
<a href='1tz2.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>'>猜  大  小</a><br/>
<a href='1tz.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>'>剪刀石头布</a><br/>
-----------<br/>
<a href='/bbs/tz/chatroom/chatroom.asp?SessionID=<%=SessionID%>'>[竞技大厅]</a><br/>   
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>

<%
response.write "</p></card></wml>"
%>


