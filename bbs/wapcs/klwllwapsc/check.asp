<!--#include FILE="md5.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
password=rs1("password")
rs1.close
Set rs1=Nothing
adminmid=md5(password&"whpku.net")
If adminmid<>request("adminmid") Then response.redirect"index.asp"
%>