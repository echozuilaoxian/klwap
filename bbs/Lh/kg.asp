<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
pp=request("pp")
if pp="1" then mmmm="允许网友下注设置"
if pp="2" then mmmm="拒绝网友下注设置"
%>
<card id="main" title="<%=mmmm%>" ontimer="/BBS/LHC/kjhm.Asp?SessionID=<%=request("SessionID")%>">
<timer value="10"/>
<p>
<%
if Cstr(Session("yxxezb"))<>"" or Cstr(Session("yxxexc"))<>"" or Session("Counter")="pass_numbers_55556666" then

sql="update ltsy set cpkg="&pp&" where cstr(id)=1"
  conn.Execute(sql)
%>
<b><%=mmmm%></b>成功！正在返回...<br/>
<%End if%>
----------<br/>
<a href="/BBS/LHC/kjhm.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
