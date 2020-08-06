<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<card title="恶魔广场">
<p>
<img src='img/npc_2.gif' alt='恶魔老人'/><br/>
<%
If time < #21:00:00# or Time > #23:00:00# Then
response.Write "恶魔老人说：<br/>实在抱歉,恶魔广场门已经锁上了.每天开放时间是21:00-23:00，每进入一次需要入场卷一张！<br/>"
else
response.Write "恶魔老人说：<br/><a href='emg.asp?pid=1&amp;SessionID="&SessionID&"'>快快进入</a><br/>恩,现在恶魔广场大门已经打开,带好入场卷的快快进入<br/>"
end if
%>
-----------<br/>
<!--#INCLUDE file="liao2.asp"-->
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>