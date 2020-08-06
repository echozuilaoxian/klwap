<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
pp=request("pp")
if pp="1" then yxxe_net="允许网友下注"
if pp="2" then yxxe_net="禁止网友下注"
%>
<card id="main" title="<%=yxxe_net%>" ontimer="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">
<timer value="10"/>
<p>
<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

sql="update System set cpkg="&pp&" where cstr(id)=1"
  myc.Execute(sql)
%>
<b><%=yxxe_net%></b><br/>设置成功！正在返回...<br/>
<%End if%>
----------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
