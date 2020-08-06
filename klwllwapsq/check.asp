<!--#include FILE="md5.asp"-->
<%
sq18="select * from admin where id=1"
Set Rs18 = Server.CreateObject("Adodb.Recordset")
rs18.open sq18,conn,1,2
password=rs18("password")
rs18.close
Set rs18=Nothing

password=md5(password&"yxxe.net,kyaa.cn,kywap.net")
If password<>request("adminmid")  and session("AdminName") = "" Then
response.Redirect "/wapsq/wap_Admin_dxyoyo.asp"
end if
If password=request("adminmid") Then
session("Adminid")="1"
end if
%>