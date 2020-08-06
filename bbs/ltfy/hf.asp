<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<%Session.CodePage=65001%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<!--#include file="admin.asp"-->
<%
Server.ScriptTimeout=999
dim check,id
 check=request("check")
 id=request("id")
 p=request("p")
 ids=request("ids")
 sql="update urls set sscs=sscs+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql) 
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from urls where id=" & id
rs.open rsstr,conn,1,2

rs("check")=check
rs.Update

  response.write "<card id='card1' title='上诉成功' ontimer='index.asp?SessionID=" & SessionID & "'><timer value='15'/><p>"
  response.write "上诉成功！你的控件已经返回重审，耐心等待吧。正在返回...<br/>----------"
%>
<br/><!--#include file="aa.asp"-->
<%
  response.write "</p></card></wml>"

else
response.redirect "index.asp"

end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>