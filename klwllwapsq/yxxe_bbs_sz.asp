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
<card id="main" title="社区论坛设置" >
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [ltsy] where id=1"
rs.open rspl,conn,1,2

if rs("ltkg")="1" then yxxe_net_kg="开放 <a href='yxxe_bbs_kg.asp?pp=2&amp;adminmid="&request("adminmid")&"'>关闭</a>"
if rs("ltkg")="2" then yxxe_net_kg="关闭 <a href='yxxe_bbs_kg.asp?pp=1&amp;adminmid="&request("adminmid")&"'>开放</a>"

if rs("op")="1" then yxxe_net_op="开放 <a href='yxxe_bbs_op.asp?pp=2&amp;adminmid="&request("adminmid")&"'>关闭</a>"
if rs("op")="2" then yxxe_net_op="关闭 <a href='yxxe_bbs_op.asp?pp=1&amp;adminmid="&request("adminmid")&"'>开放</a>"

if rs("yk")="1" then yxxe_net_yk="允许游客 <a href='yxxe_bbs_yk.asp?pp=2&amp;adminmid="&request("adminmid")&"'>必须登陆</a>"
if rs("yk")="2" then yxxe_net_yk="必须登陆 <a href='yxxe_bbs_yk.asp?pp=1&amp;adminmid="&request("adminmid")&"'>允许游客</a>"

if rs("duiji")="left" then Systemdj="居左"
if rs("duiji")="center" then Systemdj="居中"
if rs("duiji")="right" then Systemdj="居右"

if len(rs("logo"))<3 then Systemlogo="暂无"
if len(rs("logo"))>=3  then Systemlogo="<img src='"&rs("logo")&"' alt='logo'/>"
%>
论坛名称:<%=rs("title")%><br/>
论坛域名:<%=rs("Url")%><br/>
论坛迎词:<%=rs("wel")%><br/>
论坛Logo:<%=Systemlogo%><br/>
对齐方式:<%=Systemdj%>对齐<br/>
<a href="yxxe_bbs_xgsz.asp?adminmid=<%=request("adminmid")%>">修改设置</a><br/>
----------<br/>
开放电脑浏览:<%=yxxe_net_op%><br/>
论坛访问限制:<%=yxxe_net_yk%><br/>
论坛开放状态:<%=yxxe_net_kg%><br/>
------------<br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="/index.asp?adminmid=<%=request("adminmid")%>">返回网站首页</a>
<br/>
报时:<%=time%></p></card></wml>
