﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
id=request("id")
pid=request("pid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Select Case pid
   Case "1"
      itidtit="毒蛇山谷"
   Case "2"
      itidtit="死亡棺材"
   Case "3"
      itidtit="真云天空"
   Case "4"
      itidtit="蛮荒部落"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
if rs.recordcount<=1 then
if rs("tl")<1 then
sql="delete from pk Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from kywap Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from wupin Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "GAME-OVER!<br/>您被怪物杀害了<br/>包袱物品全部消失！<br/><a href='index.asp?SessionID="&SessionID&"'>继续江湖</a><br/>"
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
strSQL="select * from kywap where pid="&pid&" and cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
gwsx=clng(rs1("gj")-myfs)
if gwsx>clng(mysx) then
mysx1=clng(gwsx*0.15)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
Response.Write "逃跑失败了！凶猛的怪物扑了过来<br/>我的生命值-"&mysx1&"<br/>("&mytl&"/"&myjy&")<br/><a href='gong4.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>攻击</a>|<a href='shou12.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>防守</a>|<a href='tao12.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>逃跑</a><br/>"
else
sql="delete from kywap Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "逃跑成功！<br/>"
end if
   rs1.close
set rs1=Nothing
end if
end if
Conn.close
set Conn=nothing
%>
=========<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>
</p>
</card>
</wml>