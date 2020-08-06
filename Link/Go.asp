<!--#include file="Head.asp"-->
<!--#include file="Ip.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<% dim Rs,Sql,id
ID=trim(request.QueryString("ID"))
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select [ID],[in],[time] from [link] Where ID="&ID
Rs.open Sql,conn,1,3
Rs("in")=Rs("in")+1
Rs("time")=now()
Rs.update()
%>
<card id='card1' title='正在进入' ontimer='/index.asp'><timer value='1'/>
<p>欢迎您访问本站所有服务完全免费!如果你觉得本站不错，请加为书签！谢谢你的支持！</p>
</card></wml>
<%call ALLClose()%>

