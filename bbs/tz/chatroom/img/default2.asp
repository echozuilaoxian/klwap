﻿<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>                                                   
<card id="card1" title="表情列表">                                                    
<p>
<%wap=request.querystring("wap")%>
<img src="11.gif" alt="load..."/><br/>图11
<br/><img src="12.gif" alt="load..."/><br/>图12
<br/><img src="13.gif" alt="load..."/><br/>图13
<br/><img src="14.gif" alt="load..."/><br/>图14
<br/><img src="15.gif" alt="load..."/><br/>图15
<br/><a href='default3.asp?wap=<%=wap%>&amp;gx=<%=gx%>'>下一页</a>-<a href='default1.asp?wap=<%=wap%>&amp;gx=<%=gx%>'>上一页</a>
</p><p align="center">
<a href="/bbs/chatroom/chatroomls.asp">回聊天室</a>
<br/>------------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>&amp;gx=<%=gx%>'>&#x793E;&#x533A;&#x9996;&#x9875;</a>
</p>
</card>
</wml>

