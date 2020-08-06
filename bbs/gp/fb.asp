<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发布股市消息">
<onevent type="onenterforward">
<refresh>
<setvar name="talk" value=""/>
</refresh>
</onevent>
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
dim show
show=request("show")
%>
内容:<input type="text" name="talk" maxlength="100" size="7"/>
<br/><anchor>确定发布
<go method="post" href='fbcl.asp?SessionID=<%=SessionID%>'>
<postfield name="talk" value="$(talk)"/>
</go>
</anchor>

<br/>----------
<br/><a href='index.asp?SessionID=<%=SessionID%>'>股市</a>-<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>



