<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="修罗殿大厅">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<!--#INCLUDE file="kyaa.asp"-->
<img src='xldt.gif' alt='修罗殿大厅'/><br/>
<a href='indax.asp?pid=1&amp;SessionID=<%=SessionID%>'>修罗一层</a><br/>
<a href='indax.asp?pid=2&amp;SessionID=<%=SessionID%>'>修罗二层</a><br/>
<a href='indax.asp?pid=3&amp;SessionID=<%=SessionID%>'>修罗三层</a><br/>
<a href='indax.asp?pid=4&amp;SessionID=<%=SessionID%>'>修罗四层</a><br/>
<a href='indax.asp?pid=5&amp;SessionID=<%=SessionID%>'>修罗五层</a><br/>
<a href='indax.asp?pid=6&amp;SessionID=<%=SessionID%>'>修罗六层</a><br/>
<a href='indax.asp?pid=7&amp;SessionID=<%=SessionID%>'>修罗七层</a><br/>
------------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>|<a href="/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>

<br/>

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