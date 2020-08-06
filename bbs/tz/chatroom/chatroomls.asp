<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="社区聊天室">
<%SessionID=request.querystring("SessionID") %>
<p align="center"><a href='chatroom.asp?show=1&amp;SessionID=<%=SessionID%>'>显示表情版</a>
<br/><a href='chatroom.asp?show=0&amp;SessionID=<%=SessionID%>'>没有表情版</a><br/>~~~~~~~~~~<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>






