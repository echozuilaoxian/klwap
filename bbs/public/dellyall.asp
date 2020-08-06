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
bz=request("bz")
  ids=Session("useid")
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='清空收件箱'><p>确定全部清空?不包含保存的留言!<br/><a href='dellyall.asp?acc=1&amp;SessionID=<%=SessionID%>'>是</a> <a href='ckly.asp?pages=<% =pages %>&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
else

  Application.lock
  sql="delete from guestbook Where CStr(ids)='" & ids & "' and bz='0'"
  conn.Execute(sql)
  Application.Unlock
  response.write "<card id='card1' title='清空收件箱' ontimer='main_ckly.asp?SessionID=" & SessionID & "'><timer value='5'/><p align='left'>"
  response.write"收件箱已清空，正在返回...<br/><a href='srxx.asp?SessionID=" & SessionID & "'>[我的信箱]</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>



