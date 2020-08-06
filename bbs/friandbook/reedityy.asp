<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="修改号码">
<%
dim id
id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from mark where CStr(ids)='" & iduse & "' and Cstr(id)=" & id
  objgbrr.open ssql,conn
%>
<onevent type="onenterforward">
<refresh>
<setvar name="markname" value="<% =objgbrr("baoti") %>"/>
<setvar name="marklink" value="<% =objgbrr("link") %>"/>
</refresh>
</onevent>
<p>联系人名称：
<br/><input type="text" name="markname" value="<% =objgbrr("baoti") %>" maxlength="15"/>
<br/>联系人电话：
<br/><input type="text" name="marklink" value="<% =objgbrr("link") %>" maxlength="200"/>
<br/><anchor>提 交
<go method="post" href='reeditclyy.asp?SessionID=<%=SessionID%>'>
<postfield name="markname" value="$(markname)"/>
<postfield name="marklink" value="$(marklink)"/>
<postfield name="id" value="<% =id %>"/>
</go>
</anchor>
<br/>--------
<br/><a href='/bbs/friandbook/mybookmarkyy.asp?SessionID=<%=SessionID%>'>返回我的电话</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>
<%
conn.close
set objgbrr=nothing
set conn=nothing
%>



