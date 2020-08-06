<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>  
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>     
<card id="main" title="股票查询">  
<p>
<%
iduse=Session("useid")%>
股票代码:<input title="股票代码" name="stockcode" value="" format="*N" size="4"/><br/>
<anchor>查询<go href="guhq.asp?SessionID=<%=SessionID%>" method="get"><postfield name="stockcode" value="$(stockcode)"/></go></anchor>
<!--#include file="bb.asp" -->
</p>
</card>
</wml>