<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head><card id='card1' title='个人管理'><p>
<img src='/bbs/Public/user_120.gif' alt='个人管理'/><br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
修改个人资料<br/>-------------<br/>
<%
Response.write "<a href='reedit.asp?SessionID=" & SessionID & "'>+|修改资料</a><br/>"
Response.write "<a href='reedsr.asp?SessionID=" & SessionID & "'>+|修改生日</a><br/>"
Response.write "<a href='/bbs/skin/ccx.asp?SessionID=" & SessionID & "'>+|更换社区秀</a>"
%>
<br/>-------------
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>


