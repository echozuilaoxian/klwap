<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
ids=session("useid")
pp=request("pp")
if pp="" then pp="1"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pp="&pp&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
%>
<!--#include file="conn.asp"-->
<card title="聊天开关" ontimer="index.asp?SessionID=<%=SessionID%>">
<timer value="2"/>
<p>
<%if pp=1 then%>
<%
sql="update sx set lt=1 where cstr(ids)="&ids
  conn.Execute(sql)
%>
成功关闭聊天频道！<br/>
<%elseif pp=0 then%>
<%
sql="update sx set lt=0 where cstr(ids)="&ids
  conn.Execute(sql)
%>
成功开启聊天频道！
<br/>
<%end if%>
*********<br/>
正在返回。。。。
<br/>*********
<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p>
</card>
</wml>