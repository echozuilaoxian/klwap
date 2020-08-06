<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>

<!-- #include file="conn2.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql = "select * from rom where id="&request("id")
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此聊天室!"
else
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='修改聊天室' >
<p>聊室名称：<input name='roomname' type='text' size='10' value='<%=rs("roomname")%>'/>
<br/>
<anchor>[-保存-]
<go href='editltgformsave.asp?id=<%=request("id")%>' method='post' accept-charset='utf-8'>
<postfield name='roomname' value='$(roomname)'/>
</go>
</anchor>
<br/>------------
<br/><a href='addltgform.asp'>添加聊天室</a>
<br/><a href='adminltgform.asp'>聊天室管理</a>
<br/>
<anchor>返回上级<prev/></anchor>
<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
<%
	end if
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>