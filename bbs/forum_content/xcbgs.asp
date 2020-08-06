<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="main" title="&#x57CE;&#x5E02;&#x653F;&#x5E9C;">
<% SessionID=request.querystring("SessionID") %>
<p>&#x57CE;&#x5E02;&#x653F;&#x5E9C;<br/>----------
<br/><a href='/bbs/sqbz/index.asp?SessionID=<%=SessionID%>'>&#x57CE;&#x5E02;&#x5E2E;&#x52A9;</a>
<br/><a href='/bbs/public/find.asp?SessionID=<%=SessionID%>'>&#x67E5;&#x627E;&#x4F1A;&#x5458;</a>
<br/><a href='/bbs/public/zfgfzl.asp?SessionID=<%=SessionID%>'>&#x8FC7;&#x6237;&#x8BB0;&#x5F55;</a>
<br/><a href='/bbs/public/delzl.asp?SessionID=<%=SessionID%>'>&#x5220;&#x5E16;&#x8BB0;&#x5F55;</a>
<br/><a href='/bbs/public/xczu.asp?SessionID=<%=SessionID%>'>&#x57CE;&#x5E02;&#x76D1;&#x72F1;</a>
<% if Session("useid")="1" or Session("useid")="888" then %>
<br/><a href='/bbs/public/glcy.asp?SessionID=<%=SessionID%>'>&#x7BA1;&#x7406;&#x56E2;&#x961F;</a>
<br/><a href='/bbs/public/zfzl.asp?SessionID=<%=SessionID%>'>&#x5956;&#x7F5A;&#x8BB0;&#x5F55;</a>
<br/><a href='/bbs/public/zxqf.asp?SessionID=<%=SessionID%>'>&#x5728;&#x7EBF;&#x7FA4;&#x53D1;</a>
<% end if %>
<br/>----------<br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>&#x793E;&#x533A;&#x9996;&#x9875;</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>&#x9996;&#x9875;</a>
</p></card></wml>





