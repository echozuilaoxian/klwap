<!--#include file="conn2.asp"-->
<%
set rs1=Server.CreateObject("ADODB.Recordset")
ssql="select usejf from usereg where cstr(id)="&session("useid")
rs1.open ssql,conn2,1,2
usejf=rs1("usejf")
%>


