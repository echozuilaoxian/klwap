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
<card id="main" title="网站设计-编辑项目" >
<p>
<%
SystemSiteName=request("SystemSiteName")
SystemUrl=request("SystemUrl")
Systemlogo=request("Systemlogo")
Systemhy=request("Systemhy")
Systemdj=request("Systemdj")
Systetop=request("Systetop")
'----识别错误并跳转-----
if SystemSiteName="" then response.redirect "yxxe_bbs_xgsz.asp?adminmid="&request("adminmid")&""
'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from ltsy where Id=1"
rs.open rspl,conn,1,2
if SystemSiteName<>"" then rs("title")=SystemSiteName
if SystemUrl<>"" then rs("Url")=SystemUrl
if Systemlogo<>"" then rs("logo")=Systemlogo
if Systemhy<>"" then rs("wel")=Systemhy
if Systetop<>"" then rs("top")=Systetop
if Systemdj<>"" then rs("duiji")=Systemdj
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
编辑成功<br/>
----------<br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>