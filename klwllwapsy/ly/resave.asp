<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<%
id=request("id")
retext=request("retext")
p=request("p")

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & id
rs.open rsstr,conn,1,2

rs("retext")=retext
rs("retime")=now()
rs.update

rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="回复留言" ontimer="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">
<timer value="20"/>
<p>
回复成功，<br/>
正在返回留言本！<br/>
----------<br/>
<a href="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">[留言管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/><br/>
</p>
</card>
</wml>