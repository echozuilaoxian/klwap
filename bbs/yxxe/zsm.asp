<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="&#x60A8;&#x786E;&#x5B9A;&#x8981;&#x81EA;&#x6740;&#x5417;">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>

&#x6CE8;&#x610F;:&#x81EA;&#x6740;&#x540E;&#x6240;&#x6709;&#x5C5E;&#x6027;&#x8FD8;&#x539F;&#x81F3;&#x521D;&#x59CB;&#x72B6;&#x6001;&#xFF01;&#xFF01;&#xFF01;<br/>
&#x5305;&#x88B1;&#x4E2D;&#x6240;&#x6709;&#x7269;&#x54C1;&#x5C06;&#x6D88;&#x5931;&#x3002;&#x3002;&#x3002;&#x3002;<br/>
<a href="zs.asp?SessionID=<%=SessionID%>">&#x786E;&#x5B9A;</a>|<a href="index.asp?SessionID=<%=SessionID%>">&#x653E;&#x5F03;</a><br/>
=========<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[&#x6C5F;&#x6E56;&#x9996;&#x9875;]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
</p>
</card>
</wml>