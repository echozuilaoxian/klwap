<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">       
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="访问统计"><p>
<img src="/IMG/11.gif" alt='访问统计'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%set rs=conn.execute("select * from counter")%>
总访问IP:<%=rs("counter")%>
<br/>最高访问:<%=rs("top")%>
<br/>今日IP:<%=rs("today")%>
<br/>昨日IP:<%=rs("yesterday")%>
<br/>今日浏览:<%=rs("browser")%>
<br/>日均IP:<%=int(rs("counter")/rs("daynum"))%>
<br/>总天数:<%=rs("daynum")%>
<br/>==日期统计==<%
set rs = nothing
set rs=conn.execute("select top 7 * from Zzday order by Zzday desc")
while not rs.eof%>
<br/>日  期:<%=rs("Zzday")%>
<br/>IP:<%=rs("Stats")%>
<br/>浏览量:<%=rs("Browser")%>
<%rs.movenext
Wend
rs.close
set rs = nothing
conn.close
set conn = nothing%>
<br/><a href="qktj.asp?sid=<%=sid%>">[清空记录]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a></p></card></wml>