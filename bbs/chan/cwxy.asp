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
<card id="main" title="宠物浴室">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
lasttlls="58"
lasttls

Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" &SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>带您的宠物来浴室<br/>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" &SessionID & "'>" & lycount & "条新信息</a><br/>"
End if
%>

<br/>选择服务
<br/><a href="1xy.asp?SessionID=<%=SessionID%>">+|普通服务</a>
<br/><a href="2xy.asp?SessionID=<%=SessionID%>">+|游泳服务</a>
<br/><a href="3xy.asp?SessionID=<%=SessionID%>">+|桑拿服务</a>
<br/><a href="4xy.asp?SessionID=<%=SessionID%>">+|刷毛服务</a>
<br/><a href="5xy.asp?SessionID=<%=SessionID%>">+|按摩服务</a>
<br/>----------
<br/><a href='/bbs/reg/cwsm.asp?SessionID=<%=SessionID%>'>等级说明>></a>
<br/><a href='/bbs/chan/indexcw.asp?SessionID=<%=SessionID%>'>宠物餐厅>></a>
<br/>-------------<br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
