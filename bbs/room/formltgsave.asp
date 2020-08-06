<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>

<!-- #include file="conn2.asp" -->
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card id='main' title='操作提示'>
<p><%
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from rom"
rs.open sql,conn,1,2

rs.addnew
rs("roomname")=request("roomname")
rs("baoti")=request("baoti")
rs("idd")=request("idd")
rs.update

conn.close
set conn=nothing
Response.Write "聊天室添加成功！"     
%>
<br/>----------
<br/><a href='addltgform.asp'>添加聊天室</a>
<br/><a href='adminltgform.asp'>聊天室管理</a>
<br/>
<anchor>返回上级<prev/></anchor>
<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>