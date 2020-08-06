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
<card id="main" title="手机测试">
<p>
<% wap=request.querystring("wap") %>
<%
		hm=Request.ServerVariables("HTTP_X_UP_CALLING_LINE_ID")
if hm="" then hm=Request.ServerVariables("HTTP_X_UP_SUBNO")
Function unwide(str)
	str=replace(str,"text","&#25991;&#20214;&#26684;&#24335;")
	str=replace(str,"q=0.9","")
	str=replace(str,"image","&#22270;&#20687;&#26684;&#24335;")
	str=replace(str,"q=0.1","")
	str=replace(str,"q=0.6","")
unWide=str
end function
		%>
本机号码:
<br/><% =hm %>
<br/>--------<br/>型号:浏览器:分辩率:
<br/><% =unwide(Request.ServerVariables("HTTP_USER_AGENT")) %>
<br/>--------<br/>能接受的文件类型:
<br/><% =unwide(Request.ServerVariables("HTTP_ACCEPT")) %>
<br/>--------<br/>能接受的语言:
<br/><% =unwide(Request.ServerVariables("HTTP_ACCEPT_LANGUAGE")) %>
<br/>--------<br/>能接受的字符集:
<br/><% =unwide(Request.ServerVariables("HTTP_ACCEPT_CHARSET")) %>
<br/>--------<br/>服务端口:
<br/><% =Request.ServerVariables("SERVER_PORT")%>
<br/>--------<br/>CGI版本号:
<br/><% =Request.ServerVariables("GATEWAY_INTERFACE")%>
<br/>--------<br/>手机IP地址:
<br/><% =Request.ServerVariables("REMOTE_ADDR")%>
<br/>--------<br/>代理服务器名及端口:
<br/><% =Request.ServerVariables("HTTP_X_FORWARDED_FOR")%>
<br/>--------<br/>WAP接入点:
<br/><% =Request.ServerVariables("HTTP_X_SOURCE_ID")%>
<br/>--------<br/>接入类型:
<br/><% =Request.ServerVariables("HTTP_X_UP_BEARER_TYPE")%>
<br/>--------<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>服务广场</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>

