<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<card title="查看友链"><p>
<% id=request.Querystring("id")
classs=request.Querystring("class")
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select * from [link] Where ID="&ID
Rs.open Sql,conn,1,3
If Not rs.eof	Then
if rs("active")=0 then active="正常"
if rs("active")=1 then active="待审"
Response.Write	"网站名称: "&usb(rs("NAME"))&"<br/>"
Response.Write	"网站地址:"&usb(rs("URL"))&"<br/>"
Response.Write	"网站简介:"&usb(rs("JIAN"))&"<br/>"
Response.Write	"网站ID:"&ID&"<br/>"
Response.Write	"最后点击:"&usb(rs("TIME"))&"<br/>"
Response.Write	"链出:"&usb(rs("OUT"))&""
Response.Write	"链入:"&usb(rs("IN"))&"<br/>"
Response.Write	"=网站状态=<br/>"
Response.Write	"状态:"&active&"<br/>"
Else
Response.Write	("该友链不存在")
End If%>
<a href="Admin_class.asp?sid=<%=sid%>&amp;id=<%=classs%>">返回友链管理</a><br/>
<a href="Link_class.asp?sid=<%=sid%>">返回分类管理</a><br/><a href='Admin_index.asp?sid=<%=sid%>'>返回友链后台</a>
</p></card></wml><%call ALLClose()%>      