<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
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
if rs1.eof then
Response.Write "怪物已被你打死！还不放过它吗？<a href='index.asp?SessionID="&SessionID&"'>继续江湖</a><br/>"
else
if rs1("tl")>=1 then
gwsx=clng(rs1("fs"))
mysx=clng(myfs)
gwsx1=clng(mysx*0.2)
mysx1=clng(gwsx*0.15)
sql="update pk set tl=tl-"&gwsx1&" where pid="&pid&" and cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
gwjy1=rs1("tl")
if gwjy1<0 then
gwjy1=0
end if
Response.Write "防守中:<br/>怪物生命值-"&gwsx1&"<br/>("&gwjy1&"/"&rs1("jy")&")<br/>--------<br/>我的生命值-"&mysx1&"<br/>("&mytl&"/"&myjy&")<br/><a href='gong5.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>攻击</a>|<a href='shou13.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>防守</a>|<a href='tao13.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>逃跑</a><br/>"
else
%>
<!--#include file="djname.asp"-->
<%
        dim suiji(5)
        suiji(0)="5"
	suiji(1)="10"
	suiji(2)="15"
	suiji(3)="20"
	suiji(4)="25"
	Randomize
	I=Int(Rnd()*5)
	sjyz=suiji(I)
tsjy=clng(rs1("dj")*5)
if tsjy=0 then
tsjy=5
end if
ddyz=clng(rs1("dj")*sjyz)
if ddyz>0 then
ddyz1="得到银子"&ddyz&"两,"
sql="update wupin set yz=yz+"&ddyz&" where cstr(ids)="&ids
  conn.Execute(sql)
else
ddyz1=""
end if
sql="delete from kywap Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="update sx set jy=jy+"&tsjy&" where cstr(ids)="&ids
  conn.Execute(sql)
Response.Write "怪物已被你打死！"&ddyz1&"经验提升"&tsjy&"!<br/>"&dengjiname&"<a href='index.asp?SessionID="&SessionID&"'>继续江湖</a><br/>"
end if
   rs1.close
set rs1=Nothing
end if
end if
end if
Conn.close
set Conn=nothing
%>
</p>
</card>
</wml>