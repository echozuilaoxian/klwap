<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%pp=request("pp")
if pp="1" then mmmm="开放游客浏览设置"
if pp="2" then mmmm="关闭游客浏览设置"
%>
<card id="main" title="<%=mmmm%>" ontimer="yxxe_bbs_sz.asp?adminmid=<%=request("adminmid")%>">
<timer value="10"/>
<p>
<%
sql="update ltsy set yk="&pp&" where cstr(Id)=1"
  conn.Execute(sql)
%>
<%=mmmm%>成功！<br/>正在返回。。<br/>
----------<br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>
