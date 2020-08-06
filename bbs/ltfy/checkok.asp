<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<!--#include file="admin.asp"-->
<%
check=request("check")
ids=request("ids")
id=request("id")
p=request("p")

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where [idd]=" & ids &" and id= " & id
rs.open rsstr,conn,1,2

if check="pass" then
rs("check")=1
else
rs.delete
end if
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
<card title="操作成功" ontimer="check.asp?myid=<%=myid%>&amp;idss=<%=idss%>&amp;p=<%=p%>">
<timer value="10"/>
<p>
操作成功，<br/>
正在返回审核页面...<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
<%else%>
<%response.redirect"index.asp"%>
<% end if%>