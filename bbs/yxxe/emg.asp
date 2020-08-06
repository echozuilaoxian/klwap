<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
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
      itidtit="恶魔广场"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<%
If time < #21:00:00# or Time > #23:00:00# Then
response.Write "<img src='img/npc_2.gif' alt='恶魔老人'/><br/>恶魔老人说：<br/>实在抱歉,恶魔广场门已经锁上了.每天开放时间是21:00-23:00<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if

RefreshTime =time()
RefreshTimc =#23:00:00#
gg=DateDiff("s", RefreshTime, time())
mm=DateDiff("s", RefreshTimc, time())
response.Write "距离大门关闭剩余<b>"&gg-mm&"</b>秒<br/>"
%>
<!--#include file="conn.asp"-->
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
suijidj2(0)="5"
	suijidj2(1)="6"
	suijidj2(2)="7"
	Randomize
	I=Int(Rnd()*3)
	sjdj2=suijidj2(I)
dim suiji(5)
suiji(0)="10"
	suiji(1)="35"
	suiji(2)="70"
	suiji(3)="45"
	suiji(4)="50"
	Randomize
	I=Int(Rnd()*5)
	sjid=suiji(I)
dim suiji1(7)
        suiji1(0)="60"
	suiji1(1)="55"
	suiji1(2)="60"
	suiji1(3)="75"
	suiji1(4)="80"
	suiji1(5)="95"
	suiji1(6)="100"
	Randomize
	I=Int(Rnd()*7)
	sjid1=suiji1(I)
dim suiji2(7)
        suiji2(0)="100"
	suiji2(1)="120"
	suiji2(2)="135"
	suiji2(3)="140"
	suiji2(4)="110"
	suiji2(5)="155"
	suiji2(6)="170"
	Randomize
	I=Int(Rnd()*7)
	sjid2=suiji2(I)
dim suiji3(7)
        suiji3(0)="200"
	suiji3(1)="235"
	suiji3(2)="240"
	suiji3(3)="245"
	suiji3(4)="250"
	suiji3(5)="255"
	suiji3(6)="260"
	Randomize
	I=Int(Rnd()*7)
	sjid3=suiji3(I)
dim sjgw(21)
        sjgw(0)="1"
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
	sjgw(21)="22"
	Randomize
	I=Int(Rnd()*22)
	sjggw=sjgw(I)
if dengji<3 then
tili="30"
jinyan="30"
gong="15"
fan="10"
gdj=sjdj
elseif dengji>=3 and dengji<=6 then
tili="80"
jinyan="80"
gong=sjid1
fan=sjid1
gdj=sjdj1
elseif dengji>=7 and dengji<=10 then
tili="150"
jinyan="150"
gong=sjid1
fan=sjid2
gdj=sjdj2

elseif dengji>=11 and dengji<=15 then
tili="400"
jinyan="400"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=16 and dengji<=20 then
tili="500"
jinyan="500"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=21 and dengji<=25 then
tili="800"
jinyan="800"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=26 and dengji<=30 then
tili="1500"
jinyan="1500"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=31 and dengji<=40 then
tili="2000"
jinyan="2000"
gong=sjid3
fan=sjid3
gdj=sjdj2
else
tili="1500"
jinyan="1500"
gong=sjid3
fan=sjid3
gdj=sjdj2
end if
if pid="6" then
sjid=sjid*2
sjid1=sjid1*2
sjid2=sjid2*2
sjid3=sjid3*2
end if
if pid="7" then
jinyan=jinyan*2
gong=gong*2
fan=fan*2
end if

if tili>jinyan then
tili=jinyan
end if
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from ding where pid="&pid&" and cstr(ids)="&ids
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
Response.Write "<img src='gw3/"&sjggw&".gif' alt='图片加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻:"&rs1("gj")&"/防:"&rs1("fs")&"<br/>血量:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻:"&mygj&"/防:"&myfs&"<br/>血量:"&mytl&"/"&myjy&"<br/><a href='ding1.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>攻击</a>|<a href='fang100.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>防守</a>|<a href='yp.asp?pid="&pid&"&amp;SessionID=" & SessionID & "'>吃药</a><br/><a href='ttao100.asp?pid="&pid&"&amp;SessionID=" & SessionID & "'>逃跑</a>|<a href='jao100.asp?pid="&pid&"&amp;SessionID=" & SessionID & "'>魔法</a>|<a href='hjc.asp?SessionID=" & SessionID & "'>回城</a><br/>"
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