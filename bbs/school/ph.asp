<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>


<card id="main" title="ѧУ���а�">
<p align="left">
<br/>-----------
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")%>
<br/><a href='/bbs/school/xfpx.asp?SessionID=<%=SessionID%>'>+|ѧ������</a>
<br/><a href='/bbs/school/qs.asp?SessionID=<%=SessionID%>'>+|��������</a>
<br/><a href='/bbs/school/love.asp?SessionID=<%=SessionID%>'>+|��������</a>
<br/><a href='/bbs/school/zpx.asp?SessionID=<%=SessionID%>'>+|ѧУ����</a>
</p></card></wml>