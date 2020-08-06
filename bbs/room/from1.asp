<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<% 
dim wap
wap=request.querystring("wap")
if wap="" then wap=request.cookies("wap")

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
end function

dim objgbrs,ssql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where wap=" & Sqlstr(wap)
  objgbrs.open ssql,conn
  if objgbrs.eof then
response.redirect "out.asp"
response.end
   else

dim myc
db1="#roomsrom.mdb"
Set myc = Server.CreateObject("ADODB.Connection")  
Strconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
myc.Open Strconn 

dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from ooo where idlt=" & objgbrs("id")
rs.open sql,myc,1,2

	if rs.eof then
rs.addnew
rs("idlt")=objgbrs("id")
rs("name")=objgbrs("usename")
rs("wap")=objgbrs("wap")
rs.update
  	   else
rs("idlt")=objgbrs("id")
rs("name")=objgbrs("usename")
rs("wap")=objgbrs("wap")
rs.update
	end if

response.redirect "/bbs/tcjy/room/from.asp?wap=" & rs("wap") & ""
response.end
end if

rs.close
set rs=nothing
objgbrs.close
set objgbrs=nothing
myc.close
set myc=nothing
conn.close
set conn=nothing
%>