<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<%
SessionID=request.querystring("SessionID")
id=request("id")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg Where CStr(id)='" & Session("useid") &"'"
  objgbrs.open ssql,conn
 if id<>"" and objgbrs("usejf")>887 and objgbrs("ml")>287 and objgbrs("tili")>287 then
  Application.Lock
  sql="update usereg set usejf=usejf-888,skin='" & id & "' where CStr(id)='" & Session("useid") & "'"
  conn.execute sql
  Application.Unlock
%>
<wml><card id='card1' title="�������" ontimer='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'><timer value="5"/><p>
�޸ĳɹ�,���ڷ���...
<br/>-------------
<br/><a href='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'>��������</a>
</p></card></wml>
<%
 else
%>
<wml><card id='card1' title="�������"><p>
����ʧ�ܣ����ν�Ҳ���888������������������288�㡣
<br/><a href='/bbs/reg/useinfo.asp?id=<% =Session("useid") %>&amp;SessionID=<%=SessionID%>'>��������</a>
<%
Response.write "<br/><a href='mybook.asp?SessionID=" & SessionID & "'>�����ҵ����</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>����������ҳ</a>"
%>
</p></card></wml>
<%
 end if
conn.close
set objgbrs=nothing
set conn=nothing
%>