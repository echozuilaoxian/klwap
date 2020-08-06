<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="抓贼"><p>
<img src='nzz.gif' alt='load...'/><br/>
<% 
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="50"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
你飞身向前一串，拦在贼人面前。<br/>
<br/><anchor>攻击<go method="post" href='gong.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/><anchor>防疫<go method="post" href='fang.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/><anchor>放弃<go method="post" href='sc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/>--------
<br/><a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>社区巡逻</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>



