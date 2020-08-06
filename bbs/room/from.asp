<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=request.cookies("SessionID")
if SessionID="" then SessionID=Session("SessionID")

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
end function

dim objgbrs,ssql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where wap=" & Sqlstr(SessionID)
  objgbrs.open ssql,conn
  if objgbrs.eof then
response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
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

response.redirect "/bbs/room/index.asp?SessionID=" & rs("wap") & ""
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