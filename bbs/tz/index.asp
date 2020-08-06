<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="竞技中心">
<p align='left'>
<img src='jj.gif' alt='-*竞技中心*-'/><br/>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
iduse=Session("useid")
gfdsa=Session("ltname")
lasttlls="153"
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>您有" & lycount & "条新留言</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
End if
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID="&SessionID&"'>" & converttowidebaiti(gfdsa) & "</a>来到竞技中心<br/>"
  dim objgbrs1,ssql1
   set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from marry1 where [reuseid]=" & iduse & " and [open]=0 order by id desc"
  objgbrs1.open ssql1,conn,1,1
    if objgbrs1.eof then
%>
<%
	elseif objgbrs1("about")="J" then
%>
<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href="lb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
	elseif objgbrs1("about")="D" then
%>
<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href="dxlb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
     end if 
%>
<%
lasttlss="153"
lasttlls="153"
Response.write "<a href='/bbs/tz/chatroom/chatroom.asp?SessionID="&SessionID&"'>竞技大厅(" & RecordCount & "人)</a><br/><br/>"

%>
<a href="0.asp?SessionID=<%=SessionID%>">我要发起挑战</a><br/>
<a href="lb0.asp?SessionID=<%=SessionID%>">我发起的挑战</a><br/><br/>
<a href="ph0.asp?SessionID=<%=SessionID%>">胜利者</a>|
<a href="ph3.asp?SessionID=<%=SessionID%>">失败者</a><br/>
-----------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">〓社区首页〓</a><br/>
现在时间:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&"时"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%>分<br/>
</p>
</card>
</wml>
<%
objgbrs1.close
set objgbrs1=nothing
conn.close
set conn=nothing
%>