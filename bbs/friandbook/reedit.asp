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
<card id="card1" title="修改收藏">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
dim id
id=request("id")
  iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from my_mark_book where CStr(ids)='" & iduse & "' and Cstr(id)=" & id
  objgbrr.open ssql,conn
%>
<onevent type="onenterforward">
<refresh>
<setvar name="markname" value="<% =converttowide(objgbrr("baoti")) %>"/>
<setvar name="marklink" value="<% =objgbrr("link") %>"/>
</refresh>
</onevent>
<p>
连接名称：
<br/><input type="text" name="markname" value="<% =converttowide(objgbrr("baoti")) %>" maxlength="50"/>
<br/>链接地址：
<br/><input type="text" name="marklink" value="<% =objgbrr("link") %>" maxlength="200"/>
<br/><anchor>确定修改
<go method="post" href='reeditcl.asp?SessionID=<%=SessionID%>'>
<postfield name="markname" value="$(markname)"/>
<postfield name="marklink" value="$(marklink)"/>
<postfield name="id" value="<%=ID%>"/>
</go>
</anchor>
<br/>-----------
<br/><a href='mybookmark.asp?SessionID=<%=SessionID%>'>我的收藏</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>

<%

	conn.close
	set objgbrr=nothing
	Set conn = Nothing
%>