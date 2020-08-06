<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖仓库">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>
仓库管家说:主人你来仓库想做什么??<br/>
你说:<br/>
<a href="mycuan.asp?SessionID=<%=SessionID%>">我要存放物品</a><br/>
<a href="cu/mycuan.asp?SessionID=<%=SessionID%>">我要取出物品</a><br/>
<a href="/BBS/yxxe/yz.asp?SessionID=<%=SessionID%>">[江湖银号]</a><br/>
<a href="/BBS/yxxe/dan.asp?SessionID=<%=SessionID%>">[陈六当铺]</a><br/>
----------<br/>
<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>