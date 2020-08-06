<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="宠物赚币" ontimer='/bbs/reg/gao/gaozcl33.asp?rd=8&amp;SessionID=<%=SessionID%>'>
<timer value='5'/><p>
<% SessionID=request.querystring("SessionID") %>
<%
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao33"
rec.Open SQL,conn,1,1
   countall=countalls
conn.close
set rec=nothing
set conn=nothing

Function countalls()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gao33"
  objgbrr.open ssql,conn,1,1
countalls=objgbrr.RecordCount
set objgbrr=nothing
End Function
%>
猫猫正在睡觉,请稍候...
<br/><a href="/bbs/reg/gao/gaozcl33.asp?rd=8&amp;SessionID=<%=SessionID%>">我等不及了>></a>

</p>
</card>
</wml>