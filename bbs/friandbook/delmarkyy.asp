<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=Session("useid")
dim id
  id=request("id")
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除电话'><p>确定删除?<br/><a href='delmarkyy.asp?id=<% =id %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>是</a>
<br/><a href='viewmarkyy.asp?id=<% =id %>&amp;pages=1&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
 conn.close
 set conn=nothing
 response.end
else
  sql="delete from mark Where Cstr(ids)='" & ids & "' and Cstr(id)='" & id & "'"
  Application.lock
  conn.execute sql
  Application.Unlock
Response.write "<card id='card1' title='&#21024;&#38500;&#20070;&#31614;' ontimer='mybookmarkyy.asp?SessionID=" & SessionID & "'><timer value='2'/><p>"
Response.Write "删除成功，正在返回..."
Response.Write "<br/><a href='mybookmarkyy.asp?SessionID=" & SessionID & "'>返回我的电话</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>



