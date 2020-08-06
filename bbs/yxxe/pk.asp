<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
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
      itidtit="原始森林"
   Case "2"
      itidtit="魔鬼山洞"
   Case "3"
      itidtit="丰富矿山"
   Case "4"
      itidtit="浩瀚北海"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
if rs.recordcount<=1 then
dengji=clng(rs("dj"))
mygj=rs("gj")
myfs=rs("fs")
myjy=rs("jy")
mytl=rs("tl")
myjj=rs("jj")
myxx=rs("xx")
mysd=rs("sd")
end if
   rs.Close
      Set rs=Nothing
dim suijidj(3)
suijidj(0)="1"
	suijidj(1)="2"
	suijidj(2)="3"
	Randomize
	I=Int(Rnd()*3)
	sjdj=suijidj(I)
dim suijidj1(3)
suijidj1(0)="3"
	suijidj1(1)="4"
	suijidj1(2)="5"
	Randomize
	I=Int(Rnd()*3)
	sjdj1=suijidj1(I)
dim suijidj2(3)
suijidj2(0)="6"
	suijidj2(1)="7"
	suijidj2(2)="8"
	Randomize
	I=Int(Rnd()*3)
	sjdj2=suijidj2(I)
dim suiji(5)
suiji(0)="10"
	suiji(1)="15"
	suiji(2)="50"
	suiji(3)="25"
	suiji(4)="30"
	Randomize
	I=Int(Rnd()*5)
	sjid=suiji(I)
dim suiji1(7)
        suiji1(0)="20"
	suiji1(1)="25"
	suiji1(2)="30"
	suiji1(3)="35"
	suiji1(4)="40"
	suiji1(5)="45"
	suiji1(6)="50"
	Randomize
	I=Int(Rnd()*7)
	sjid1=suiji1(I)
dim suiji2(7)
        suiji2(0)="40"
	suiji2(1)="45"
	suiji2(2)="50"
	suiji2(3)="55"
	suiji2(4)="60"
	suiji2(5)="65"
	suiji2(6)="70"
	Randomize
	I=Int(Rnd()*7)
	sjid2=suiji2(I)
dim suiji3(7)
        suiji3(0)="70"
	suiji3(1)="75"
	suiji3(2)="80"
	suiji3(3)="85"
	suiji3(4)="90"
	suiji3(5)="95"
	suiji3(6)="100"
	Randomize
	I=Int(Rnd()*7)
	sjid3=suiji3(I)
dim sjgw(21)
        sjgw(0)=""
	sjgw(1)="1"
	sjgw(2)="2"
	sjgw(3)="3"
	sjgw(4)="4"
	sjgw(5)="5"
	sjgw(6)="6"
	sjgw(7)="7"
	sjgw(8)="8"
	sjgw(9)="9"
	sjgw(10)="10"
	sjgw(11)="11"
	sjgw(12)="12"
	sjgw(13)="13"
	sjgw(14)="14"
	sjgw(15)="15"
	sjgw(16)="16"
	sjgw(17)="17"
	sjgw(18)="18"
	sjgw(19)="19"
	sjgw(20)="20"
	sjgw(21)="21"
	Randomize
	I=Int(Rnd()*21)
	sjggw=sjgw(I)
if pid="2" then
sjid=sjid*3
sjid1=sjid1*3
sjid2=sjid2*3
sjid3=sjid3*3
end if
if dengji<3 then
tili="30"
jinyan="30"
gong="15"
fan="10"
gdj=sjdj
elseif dengji>=3 and dengji<=6 then
tili="60"
jinyan="60"
gong=sjid1
fan=sjid1
gdj=sjdj1
elseif dengji>=7 and dengji<=10 then
tili="80"
jinyan="80"
gong=sjid2
fan=sjid2
gdj=sjdj2
elseif dengji>=11 and dengji<=20 then
tili="120"
jinyan="120"
gong=sjid2
fan=sjid2
gdj=sjdj2
elseif dengji>=21 and dengji<=50 then
tili="150"
jinyan="150"
gong=sjid2
fan=sjid2
gdj=sjdj2
elseif dengji>=54 and dengji<=100 then
tili="200"
jinyan="200"
gong=sjid2
fan=sjid2
gdj=sjdj2
else
tili="500"
jinyan="500"
gong=sjid3
fan=sjid3
end if
if pid="2" then
jinyan=jinyan*13
gong=gong*8
fan=fan*8
end if
if tili>jinyan then
tili=jinyan
end if
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from pk where pid="&pid&" and cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
if rs1.recordcount<1 then
rs1.addnew
rs1("ids")=ids
rs1("pid")=pid
rs1("tl")=tili
rs1("jy")=jinyan
rs1("gj")=gong
rs1("fs")=fan
rs1("dj")=gdj
rs1.update
end if
if rs1("tl")>rs1("jy") then
rs1("tl")=rs1("jy")
rs1.update
end if
Response.Write "<img src='gw/gw"&sjggw&".jpg' alt='怪物图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='gong.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>攻击</a>|<a href='shou.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>防守</a>|<a href='yp.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>吃药</a><br/><a href='tao.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>逃跑</a>|<a href='jao.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>魔法卷轴</a><br/>"
   rs1.close
set rs1=Nothing
Conn.close
set Conn=nothing
%>
-----------<br/>
<!--#INCLUDE file="liao2.asp"-->
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[网站首页]</a>
</p>
</card>
</wml>