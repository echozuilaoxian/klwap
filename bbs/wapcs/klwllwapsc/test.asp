<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")
rs1.close
Set rs1=Nothing

sq1="select * from data order by id"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
If Not rs1.bof Or Not rs1.eof Then

For i=1 To rs1.RecordCount
dir=rsformPath&"\"&rs1("dataname")

file=Server.Mappath("\")&"\"&dir
newplace="G:\wap\updata"
Set fso = CreateObject("Scripting.FileSystemObject")
Set f1 = fso.GetFile(file)
f1.Copy newplace
set fso=nothing
%>
<%next%>
<%End if%>
