<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
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
  ids=Session("useid")
bz=request("bz")
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='清空发件箱'><p>确定全部清空发件箱?<br/><a href='dellyall1.asp?acc=1&amp;SessionID=<%=SessionID%>'>是</a> <a href='fx.asp?pages=<% =pages %>&amp;SessionID=<%=SessionID%>'>否</a><br/>注:清空发件箱,对方所有关于你发送的信息同样清除.对方保存的除外。</p></card></wml>

<%
else
  Application.lock
  sql="delete from guestbook Where CStr(reids)='" & ids & "' and bz='0'"
  conn.Execute(sql)
  Application.Unlock
  response.write "<card id='card1' title='清空发件箱' ontimer='fx.asp?SessionID=" & SessionID & "'><timer value='5'/><p align='left'>"
  response.write"发件箱已清空，正在返回...<br/><a href='srxx.asp?SessionID=" &SessionID& "'>私人信箱</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>



