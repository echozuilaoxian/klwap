<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="张三客栈">
<p>
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
<%
Response.Write "告示：本店住店每天银子100两，喝酒银子50两。明码实价，童叟无欺，概不赊帐！<br/>"
Response.Write "店小二：这位少侠，请问是住店还是喝酒？<br/>"
Response.Write "你说：<br/><a href='/bbs/yxxe/ke2.asp?wid=1&amp;SessionID="&SessionID&"'>我要喝酒</a><br/>"
Response.Write "<a href='ke2.asp?wid=2&amp;SessionID="&SessionID&"'>我要住店</a><br/>"
Response.Write "<a href='index.asp?SessionID="&SessionID&"'>什么鸟店，太贵，我走也</a>"
%>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/liao.asp"-->
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[网站首页]</a><br/>
</p>
</card>
</wml>