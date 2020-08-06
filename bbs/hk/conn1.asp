<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
'on error resume next
Response.Buffer = True
Response.Expires=-1
public devid
devid=getdevid()

'测试信息，正式使用前记得删除
'session("useid")=10
'session("ltname")=""
'devid="13888888888"

dim db,conn,connstr
db="#xh6666.cn.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.open connstr

sub closeconn()
conn.close
set conn=nothing
end sub
%><!--#include file="inc/const.asp"-->