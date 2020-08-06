<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim pages
  pages=request("pages")
if pages="" then pages=1
  id=request("id")
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除信息'><p>确定删除?<br/><a href='delly.asp?id=<% =id %>&amp;pages=<% =pages %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>是</a> <a href='cklycl.asp?id=<% =id %>&amp;pages=<% =pages %>&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
else
  Application.lock
  sql="delete from guestbook Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  Application.Unlock
  response.write "<card id='card1' title='删除信息' ontimer='main_ckly.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'><timer value='5'/><p align='left'>"
  response.write"删除成功，正在返回...<br/><a href='main_ckly.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>收件箱</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>



