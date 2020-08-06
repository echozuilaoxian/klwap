<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
lid=request("lid")
pid=request("pid")
if pid="" then pid="1"

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&"&lid="&lid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<card title="武者大厅">
<p>
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where ids="&ids
rs.open strSQL,Conn,1,1
if rs.recordcount<=1 then
if rs("tl")<1 then
sql="delete from sx Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "GAME-OVER!<br/>编者按:可怜少侠壮志未酬生先死!<br/>你说:老子十八年后又是一条好汉!<br/><a href='index.asp?SessionID="&SessionID&"'>继续江湖</a><br/>"
   rs.close
set rs=Nothing
else
dengji=clng(rs("dj"))
mygj=rs("gj")
myfs=rs("fs")
myjy=rs("jy")
mytl=rs("tl")
   rs.close
set rs=Nothing
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from tz where pid="&pid&" and cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
dfname=rs1("name")
tzyz=rs1("txt")
if rs1.eof then
Response.Write "[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]已被你打败！还不放过它吗？<a href='tt.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>继续挑战</a><br/>"
else
if rs1("tl")>=1 then
gwsx=clng(rs1("gj")+rs1("fs"))
mysx=clng(mygj+myfs)
gwsx1=clng(mysx*0.2)
mysx1=clng(gwsx*0.19)
sql="update tz set tl=tl-"&gwsx1&" where pid="&pid&" and cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
gwjy1=rs1("tl")
if gwjy1<0 then
gwjy1=0
end if
Response.Write "攻击中:<br/>[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]生命值-"&gwsx1&"<br/>("&gwjy1&"/"&rs1("jy")&")<br/>--------<br/>我的生命值-"&mysx1&"<br/>("&mytl&"/"&myjy&")<br/><a href='sfpk.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>攻击</a><br/>"
else
%>
<!--#include file="djname.asp"-->
<%
tsjy=clng(rs1("dj")*5)
if tsjy=0 then
tsjy=5
end if
ddyz=clng(tzyz*0.8)
if ddyz>0 then
ddyz1="得到银子"&ddyz&"两,"
sql="update wupin set yz=yz-"&tzyz&" where cstr(ids)="&lid
  conn.Execute(sql)
sql="update wupin set yz=yz+"&ddyz&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set pk=pk+1 where cstr(ids)="&ids
  conn.Execute(sql)
end i