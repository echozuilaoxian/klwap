<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<card title="自杀成功">
<p>
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
mysd=rs("sd")
myjj=rs("jj")
myxx=rs("xx")
sql="delete from sx Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from pk Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from kywap Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from luo Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from ding Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)

sql="delete from zb Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from wupin Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "自杀成功<br/>您的各项属性已经恢复到初始状态<br/>"
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from sx where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "您现在的属性如下：<br/>----------<br/>攻击力：[" & rs("gj") &"]<br/>防御力：[" & rs("fs") &"]<br/>经验值：[" & rs("jy") &"]<br/>生命值：[" & rs("tl") &"/" & rs("jy") &"]<br/>当前等级：[" & rs("dj") &"]<br/>"
   rs.close
set rs=Nothing
Conn.close
set Conn=nothing
%>
----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>