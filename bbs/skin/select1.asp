<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
id=request("id")
ids=request("ids")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="update usereg set skin='" & id & "' where CStr(id)='" & Session("useid") & "'"
  conn.execute sql
  Application.Unlock

sql="Delete FROM guestbook WHERE CStr(id)='"&ids&"'"
  conn.Execute(sql)
%>
<wml><card id='card1' title="礼物应用" ontimer='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'><timer value="5"/><p>
成功穿上新衣服...
<br/>-------------
<br/><a href='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'>个人资料</a>
</p></card></wml>
<%
conn.close
set objgbrs=nothing
set conn=nothing
%>
