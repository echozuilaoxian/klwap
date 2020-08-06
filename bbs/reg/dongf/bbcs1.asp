<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
%>
<card id="card1" title="登记BB记录">  
<p>登记BB记录<br/>-------------<br/>
填入你们孩子的名字,你们两人所填名字必须一样：
<br/><input type="text" name="myhz" value="" maxlength="10" size="8"/>
<br/><anchor>提 交
<go method="post" href='/bbs/reg/dongf/bbcscl1.asp?SessionID=<%=SessionID%>'>
<postfield name="myhz" value="$(myhz)"/>
</go>
</anchor>
<br/>注:请不要退出,退出后你的宝宝可能会夭折!
<%
Response.write "<br/>-------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a>"%>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>




