<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
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
set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select * from wupin where ids="&ids
rsppp.open rsstr,conn,1,2
jjjj1=rsppp("mm1")
jjjj2=rsppp("mm2")
jjjj3=rsppp("mm4")
   rsppp.close
set rsppp=Nothing%>

<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
mysd=rs("sd")
myjj=rs("jj")
myxx=rs("xx")
if rs.recordcount<=1 then
if rs("tl")<1 then
sql="delete from sx Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)'50
sql="delete from pk Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from yxxeb Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from zb Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from wupin Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "你挂了，哇！血溅当场!<br/>编者按:可怜少侠壮志未酬生先死!<br/>你说:老子十八年后又是一条好汉!<br/><a href='index.asp?SessionID="&SessionID&"'>[继续江湖]</a><br/>"
   rs.close
set rs=Nothing
'-----------------
else
'-----------------
dengji=clng(rs("dj"))
mygj=rs("gj")
myfs=rs("fs")
myjy=rs("jy")
mytl=rs("tl")
   rs.close
set rs=Nothing
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from yxxeb where pid="&pid&" and cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
if rs1.eof then
Response.Write "怪物已被你打死！还不放过它吗？<br/>难道你有虐尸癖！妈啊，你才是怪物！<br/><a href='ljzq2.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>[继续前进]</a><br/>"
'-----------------
else
'-----------------
if rs1("tl")>=1 then
gwsx=clng(rs1("gj")+rs1("fs"))
mysx=clng(mygj+myfs)
'------闪电魔法-----
if mysd<>0 then
sql="update sx set sd=sd-1 where cstr(ids)="&ids
  conn.Execute(sql)
gwpps=clng(mysx*0.2)
gwsx1=clng(gwpps*2)
mysx1=clng(gwsx*0.19)
'-----结界魔法----
elseif myjj<>0 then
sql="update sx set jj=jj-1 where cstr(ids)="&ids
  conn.Execute(sql)
mysx1=clng(gwsx*0.00)
gwsx1=clng(mysx*0.2)
'-----吸血魔法---
elseif myxx<>0 then
sql="update sx set xx=xx-1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set tl=tl+"&gwsx1&" where cstr(ids)="&ids
  conn.Execute(sql)
mysx1=clng(gwsx*0.00)
gwsx1=clng(mysx*0.2)
'-----没有魔法----
else
gwsx1=clng(mysx*0.2)
mysx1=clng(gwsx*0.19)
end if
'-----------------
sql="update yxxeb set tl=tl-"&gwsx1&" where pid="&pid&" and cstr(ids)="&ids
  conn.Execute(sql)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
gwjy1=rs1("tl")
if gwjy1<0 then
gwjy1=0
end if
Response.Write "============<br/>>>攻击中......<br/>怪物生命值-"&gwsx1&"<br/>("&gwjy1&"/"&rs1("jy")&")<br/>============<br/>"
%>
<!--1===闪电效果===1-->
<%if mysd<>0 then%>
闪电魔法还剩<%=mysd%>次！<br/>
我的生命值-<%=mysx1%><br/>
<!--1===结界效果===1-->
<%elseif myjj<>0 then%>
结界魔法还剩<%=myjj%>次！<br/>
我的生命值-<%=mysx1%><br/>
<!--1===吸血魔法===1-->
<%elseif myxx<>0 then%>
吸血魔法还剩<%=myxx%>次！<br/>
我的生命值+<%=gwsx1%><br/>
<!--1==============1-->
<%else%>
<!--1=============1-->

我的生命值-<%=mysx1%>
<%end if%>
<br/>(<%=mytl%>/<%=myjy%>)
<br/>[<a href='kb.asp?pid=<%=pid%>&amp;t=<%time%>&amp;SessionID=<%=SessionID%>'>攻击</a>][<a href='shou8.asp?pid=<%=pid%>&amp;t=<%time%>&amp;SessionID=<%=SessionID%>'>防守</a>]<br/>[<a href='yp.asp?pid=<%=pid%>&amp;SessionID=<%=SessionID%>'>吃药</a>][<a href='tao8.asp?pid=<%=pid%>&amp;SessionID=<%=SessionID%>'>逃跑</a>]<br/>
<%if jjjj1<>0 or jjjj2<>0 or jjjj3<>0 then%>
使用<a href='Jao.asp?pid=<%=pid%>&amp;wap=<%=wap%>'>魔法卷</a>
<br/>
<%end if%>
<%else%>
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
tsjy=clng(rs1("dj")*10)
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
sql="delete from yxxeb Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="update sx set jy=jy+"&tsjy&" where cstr(ids)="&ids
  conn.Execute(sql)
Response.Write "怪物已被你打死！"&ddyz1&"经验提升"&tsjy&"!<br/>"&dengjiname&"<a href='ljzq2.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>[继续前进]</a><br/>"
end if
   rs1.close
set rs1=Nothing
end if
end if
end if
Conn.close
set Conn=nothing
%>
============<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>