<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<% SessionID=request.querystring("SessionID")%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="挑战败者榜">
<p>
挑战败者榜<br/>-----------<br/>
<a href='phdx2.asp?SessionID=<%=SessionID%>'>挑战王[猜大小]</a><br/>
<a href='ph2.asp?SessionID=<%=SessionID%>'>挑战王[剪刀石头布]</a><br/>
<a href='index.asp?SessionID=<%=SessionID%>'>>返回竞技中心</a><br/>    
-----------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
</p>
</card>
</wml>