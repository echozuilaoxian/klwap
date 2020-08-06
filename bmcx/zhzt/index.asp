<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="st.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="简繁互换" >
<p>
<% dim pw,txt,sid
sid=request.querystring("sid")
pw=request("pw")
txt=request("txt")
if pw=1 then
if txt="" then response.redirect "index.asp"
response.write""&st(""&txt&"",0)&""
elseif pw=2 then
if txt="" then response.redirect "index.asp"
response.write""&st(""&txt&"",1)&""
else
%>
输入要转换的字符:<br/>
<input type="text" name="txt<%=minute(now)%><%=second(now)%>" title="简体转繁体" value="" maxlength="300"/><br/>
<anchor title="简体转繁体">简体转繁体
<go method="post" href="index.asp?pw=1&amp;sid=<%=sid%>">
<postfield name="txt" value="$(txt<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<anchor title="繁体转简体">繁体转简体
<go method="post" href="index.asp?pw=2&amp;sid=<%=sid%>">
<postfield name="txt" value="$(txt<%=minute(now)%><%=second(now)%>)"/>
</go></anchor>
<%end if%>
<br/>----------<br/>
<a href="/bm/bm.asp?sid=<%=sid%>">便民查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
</p></card></wml>