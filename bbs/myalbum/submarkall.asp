<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除图片'><p>确定全部删除?相册不受影响<br/><a href='submarkall.asp?acc=1&amp;SessionID=<%=SessionID%>'>是</a>
<br/><a href='/bbs/myalbum/mybook.asp?SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
else
  sql="delete from myalbum Where Cstr(ids)='" & ids & "'and bz='0'"
  Application.lock
  conn.execute sql
  Application.Unlock
Response.write "<card id='card1' title='删除图片' ontimer='mybook.asp?SessionID=" & SessionID & "'><timer value='10'/><p>删除成功，正在返回..."
Response.Write "<br/><a href='mybook.asp?SessionID=" & SessionID & "'>返回我的书包</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>



