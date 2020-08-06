<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<%sjhm=request("sjhm")
if sjhm="" then sjhm="0"
myan=dlubb(request("myan"))
if myan="" then myan="0"
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="找回结果">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from Users where sjhm='"&sjhm&"'"
rs.open sql,conn,1,2
if rs.eof then
cww="没有该账号信息！<br/>"
Elseif rs("wtda")<>myan then cww="答案错误<br/>"
else
mymm=rs("mm")
myid=rs("id")
gw=rs("grsb")
end if
rs.close
set rs=nothing%>
<%if cww="" then%>
找回成功！请牢记您的资料<br/>
手机号：<%=sjhm%><br/>
密码是：<%=mymm%><br/>
<a href="index.asp?hk=<%=gw%>">直接进入网站</a><br/>
<%else%>
<%=cww%>
<%end if%>
---------<br/>
<a href="login.asp">手工登陆</a><br/>
<a href="sgzc.asp">免费注册</a><br/>
<a href="/">返回首页</a>
<%
conn.close
set conn=nothing%>
</p></card></wml>