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
dim id,ids
  id=request("id")
  ids=request("ids")
  acc=request("acc")
if Session("Counter")="pass_numbers_55556666" then
if acc="" then
%>
<card id='card1' title='删除图片'><p>确定删除?<br/><a href='dels.asp?id=<% =id %>&amp;ids=<% =ids %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>是</a> <a href='/bbs/myalbum/myalbum.asp?id=<% =id %>&amp;pages=1&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
 conn.close
 set conn=nothing
 response.end
else
  sql="delete from myalbum Where Cstr(ids)='" & ids & "' and Cstr(id)='" & id & "'"
  Application.lock
  conn.execute sql
sql="delete from myalbum_re Where Cstr(albumid)='" & id & "'"
  Application.lock
  conn.execute sql
  Application.Unlock
Response.write "<card id='card1' title='删除图片' ontimer='/bbs/myalbum/new.asp?SessionID=" & SessionID & "'><timer value='5'/><p>"
Response.Write "删除成功，正在返回..."
Response.Write "<br/><a href='/bbs/myalbum/new.asp?SessionID=" & SessionID & "'>最新相片</a>"
response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
end if
end if
  conn.close
  set conn=nothing
%>



