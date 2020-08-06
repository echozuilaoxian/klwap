<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="大厅发言"><p>

发言内容:
<br/><input type="text" name="talks" maxlength="60"/>
<br/><anchor>快速发言
<go method="post" href='talkcl.asp?SessionID=<%=SessionID%>&amp;wxwm=<%=wxwm%>'>
<postfield name="talks" value="$(talks)"/>
<postfield name="show" value="<% =show %>"/>
</go>
</anchor>
<%
Response.write "<br/>----------<br/><a href='chats.asp?SessionID=" & SessionID & "'>交流大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a>"
%>
<%
conn.close
set conn=nothing%>
</p>
</card>
</wml>