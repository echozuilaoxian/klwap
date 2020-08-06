<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区医院">
<p align="left">
<img src="yi.gif"  alt="医院"/>
<%
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
Response.write "<br/>" & converttowidebaiti(gfdsa) & ",来医院做啥呢?<br/>------------<br/>"

Response.write "<a href='myjy.asp?SessionID=" & SessionID & "'>+|做B超</a><br/>"
Response.write "<a href='/bbs/reg/dongf/yiyfc.asp?SessionID=" & SessionID & "'>+|妇产科</a><br/>"
Response.write "<a href='myhz.asp?SessionID=" & SessionID & "'>+|婴儿科</a><br/>"
Response.write "<a href='/bbs/reg/dongf/nnfc.asp?SessionID=" & SessionID & "'>+|孩子父亲登记</a><br/>"%>

-----------<br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p></card></wml>
