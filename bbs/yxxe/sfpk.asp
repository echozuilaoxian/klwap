<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
wap=request("wap")
Server.ScriptTimeout=999
id=request("id")

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
id=request("id")
ids=session("useid")
%>
<%set rs5=Server.CreateObject("ADODB.Recordset")
strSQL="select * from tz where cstr(id)="&id
rs5.open strSQL,Conn,1,2
dfname=rs5("name")
tzyz=rs5("txt")
lid=rs5("lid")
   rs5.close
set rs5=Nothing
%>
<card title="武者大厅">
<p>

<%
dim tzyz2
tzyz2=clng(tzyz*2)
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
if rs.recordcount<=1 then
if rs("tl")<1 then
sql="update wupin set yz=yz-"&tzyz&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz+"&tzyz2&" where cstr(ids)="&lid
  conn.Execute(sql)
sql="update sx set pk1=pk1+1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set pk=pk+1 where cstr(ids)="&lid
  conn.Execute(sql)
sql="update tz set jg=1 where cstr(id)="&id
  conn.Execute(sql)
Response.Write "GAME-OVER!<br/>你输给[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]"&tzyz&"两银子,<br/>你说:君子报仇，十年不晚!<br/><a href='tt.asp?SessionID="&SessionID&"'>继续挑战</a><br/>"
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
strSQL="select * from tz where cstr(id)="&id
rs1.open strSQL,Conn,1,2
dfname=rs1("name")
if rs1.eof then
Response.Write "[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]已被你打败！还不放过它吗？<a href='tt.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>回到大厅</a><br/>"
else
if rs1("tl")>=1 then
gwsx=clng(rs1("gj")+rs1("fs"))
mysx=clng(mygj+myfs)
gwsx1=clng(mysx*0.2)
mysx1=clng(gwsx*0.19)
sql="update tz set tl=tl-"&gwsx1&" where cstr(id)="&id
  conn.Execute(sql)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
gwjy1=rs1("tl")
if gwjy1<0 then
gwjy1=0
end if
Response.Write "攻击中:<br/>[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]生命值-"&gwsx1&"<br/>("&gwjy1&"/"&rs1("jy")&")<br/>--------<br/>我的生命值-"&mysx1&"<br/>("&mytl&"/"&myjy&")<br/><a href='sfpk.asp?id="&id&"&amp;lid="&lid&"&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>攻击</a><br/>"
else
%>
<!--#include file="djname.asp"-->
<%
ddyz=clng(tzyz*0.8)
if ddyz>0 then
ddyz1="得到银子"&ddyz&"两,"
sql="update wupin set yz=yz+"&ddyz&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set pk=pk+1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set pk1=pk1+1 where cstr(ids)="&lid
  conn.Execute(sql)
end if
sql="update tz set jg=2 where cstr(id)="&id
  conn.Execute(sql)
Response.Write "[<a href='dfzl.asp?id="&lid&"&amp;SessionID="&SessionID&"'>"&dfname&"</a>]已被你打败！<br/>"&ddyz1&"<br/>!<br/>"&dengjiname&"<a href='tt.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>继续挑战</a><br/>"
end if
   rs1.close
set rs1=Nothing
end if
end if
end if
Conn.close
set Conn=nothing
%>
=========<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p>
</card>
</wml>