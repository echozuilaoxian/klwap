<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="职业学校">
<p align="left">
<img src='/bbs/logo/xnzy.gif' alt='工作'/><br/>
你好:职业中心欢迎你
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<br/>请选择你要工作的单位<br/>-------------<br/>

<a href="/bbs/job/sy.asp?SessionID=<%=SessionID%>">+|商业广场</a><br/>
<a href='/bbs/job/ent.asp?SessionID=<%=SessionID%>'>+|娱 乐 圈</a><br/>
-------------<br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>时间:<%=time%>
</p></card></wml>