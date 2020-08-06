<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<%
name=request("name")
title=request("title")
text=request("text")
face=request("face")
lianxi=request("lianxi")
open=request("open")
mm=request("mm")
agent=request.serverVariables("HTTP_USER_AGENT")
if name="" then response.redirect "ly_add.asp"
if title="" then response.redirect "ly_add.asp"
if text="" then response.redirect "ly_add.asp"
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] order by ID desc"
rs.open rsstr,conn,1,2
dim errr
errr=0
if rs.recordcount>0 then
	if rs("name")=name and rs("text")=text then errr=1
end if

if errr=1 then eer="请不要重复留言，<br/>正在返回留言首页！<br/>"
if errr<>1 then
rs.addnew
if name<>"" then rs("name")=name
if title<>"" then rs("title")=title
if text<>"" then rs("text")=text
if face<>"" then rs("face")=face
rs("time")=now()
if lianxi<>"" then rs("lianxi")=lianxi
if open<>"" then rs("open")=open
if mm<>"" then rs("num")=mm
rs("agent")=agent
rs.update
end if

rs.close
set rs=Nothing
conn.close
set conn=nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="发表留言" ontimer="ly.asp?hk=<%=hk%>">
<timer value="20"/>
<p>
<%if eer="" then%>
发表成功，<br/>
正在返回留言首页！<br/>
<%else%>
<%=eer%>
<%end if%>
----------<br/>
<a href="ly.asp?hk=<%=hk%>">留言首页</a><br/>
<a href="/index.asp?hk=<%=hk%>">网站首页</a><br/>
</p>
</card>
</wml>