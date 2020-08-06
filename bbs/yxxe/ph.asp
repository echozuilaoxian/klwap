<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="英雄排行榜"><p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
英雄排行榜<br/>
----------<br/>
>><a href="P1.asp?SessionID=<%=SessionID%>">级别排行</a><br/>
>><a href="P2.asp?SessionID=<%=SessionID%>">财富排行</a><br/>
>><a href="P3.asp?SessionID=<%=SessionID%>">胜利排行</a><br/>
>><a href="P4.asp?SessionID=<%=SessionID%>">攻击防御</a><br/>
>><a href="P5.asp?SessionID=<%=SessionID%>">等级说明</a><br/>
----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>



