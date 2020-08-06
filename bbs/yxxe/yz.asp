<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖银号">
<p>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
Response.Write "告示:本银号童叟无欺,现银支付！<br/>掌柜：这位少侠，请问有什么要帮忙？<br/>"
Response.Write "<a href='/bbs/yxxe/bank.asp?SessionID="&SessionID&"'>+|寄存银两</a><br/>"
Response.Write "<a href='/bbs/yxxe/bankp.asp?SessionID="&SessionID&"'>+|提取银两</a><br/>"
Response.Write "<a href='song.asp?wpid=yz&amp;SessionID="&SessionID&"'>+|银两转帐</a><br/>"
Response.Write "<a href='zhyz.asp?SessionID="&SessionID&"'>+|金币换银两</a><br/>"
Response.Write "<a href='zhyz1.asp?SessionID="&SessionID&"'>+|银两换金币</a>"%>
<br/>
-----------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>
</p>
</card>
</wml>