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
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select usejf from usereg Where CStr(id)='" & Session("useid") &"'"
  objgbrs.open ssql,conn
 if id<>"" and objgbrs("usejf")>2000then
  Application.Lock
  sql="update usereg set usejf=usejf-2000,skin='" & id & "' where CStr(id)='" & Session("useid") & "'"
  conn.execute sql
  Application.Unlock
%>
<wml><card id='card1' title="形象选择" ontimer='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'><timer value="5"/><p>
修改成功,正在返回...
<br/>-------------
<br/><a href='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'>个人资料</a>
</p></card></wml>
<%
 else
%>
<wml><card id='card1' title="形象选择"><p>
嘿嘿...您滴金币不够喔~~
<br/><a href='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'>个人资料</a>
</p></card></wml>
<%
 end if
conn.close
set objgbrs=nothing
set conn=nothing
%>



