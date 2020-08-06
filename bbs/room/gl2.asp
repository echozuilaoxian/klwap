<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="聊室管理员">
<p align='left'>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from admin where order by id"
rs.open sql,myc,1,2
response.write "聊室管理员列表<br/>-----------<br/>"
do while not rs.eof
  response.write "<a href='/bbs/reg/useinfo.asp?id=" & rs("idd") & "&amp;SessionID=" & SessionID & "'>ID:" & rs("idd") & "</a><br/>"
rs.movenext
loop
response.write "-----------<br/>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">[聊天广场]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>