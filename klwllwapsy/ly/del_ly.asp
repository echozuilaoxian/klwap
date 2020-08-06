<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<%
id=request.QueryString("id")
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where ID=" & id
rs.open rsstr,conn,1,2

if rs.recordcount=1 then
rs.delete
rs.update
rs.close
set rs=nothing
end if

conn.close
set conn=nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="删除留言" ontimer="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">
<timer value="20"/>
<p>
删除成功，<br/>
正在[留言管理]！<br/>
----------<br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/><br/>
</p>
</card>
</wml> 