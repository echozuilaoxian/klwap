<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
pid=request("pid")

if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Select Case pid
   Case "1"
      itidtit="修罗殿一层"
   Case "2"
      itidtit="修罗殿二层"
   Case "3"
      itidtit="修罗殿三层"
   Case "4"
      itidtit="修罗殿四层"
   Case "5"
      itidtit="修罗殿五层"
   Case "6"
      itidtit="修罗殿六层"
   Case "7"
      itidtit="修罗殿七层"
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
dim sjgw(25)
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
	sjgw(22)="22"
	sjgw(23)="23"
	sjgw(24)="24"
	sjgw(25)="25"
	Randomize
	I=Int(Rnd()*25)
	sjggw=sjgw(I)

if pid="2" and dengji<=9 then
Response.Write "修罗殿二层等级低于<b><u>10</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="3" and dengji<=14 then
Response.Write "修罗殿三层等级低于<b><u>15</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="4" and dengji<=19 then
Response.Write "修罗殿四层等级低于<b><u>20</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="5" and dengji<=24 then
Response.Write "修罗殿五层等级低于<b><u>25</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="6" and dengji<=29 then
Response.Write "修罗殿六层等级低于<b><u>30</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="7" and dengji<=34 then
Response.Write "修罗殿七层等级低于<b><u>35</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if

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
tili="700"
jinyan="700"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=26 and dengji<=30 then
tili="800"
jinyan="800"
gong=sjid3
fan=sjid3
gdj=sjdj2

elseif dengji>=31 and dengji<=40 then
tili="1000"
jinyan="1000"
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
strSQL="select * from luo where pid="&pid&" and cstr(ids)="&ids
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
if pid="1" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan1.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang1.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao1.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="2" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan2.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang2.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao2.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="3" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan3.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang3.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao3.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="4" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan4.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang4.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao4.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="5" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan5.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang5.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao5.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="6" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan6.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang6.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao6.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
if pid="7" then
Response.Write "<img src='gw2/gw"&sjggw&".gif' alt='图加载中..'/><br/>在你面前出现了一只怪物<br/>怪物属性:<br/>攻击力:"&rs1("gj")&"<br/>防御力:"&rs1("fs")&"<br/>生命值:"&rs1("tl")&"/"&rs1("jy")&"<br/>-----------<br/>我的属性:<br/>攻击力:"&mygj&"<br/>防御力:"&myfs&"<br/>生命值:"&mytl&"/"&myjy&"<br/><a href='/bbs/yxxe/kan7.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>攻击</a>|<a href='/bbs/yxxe/yp.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>吃药</a>|<a href='/bbs/yxxe/fang7.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID="& SessionID &"'>防守</a><br/><a href='/bbs/yxxe/ttao7.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>逃跑</a>|<a href='/bbs/yxxe/jao.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>魔法</a>|<a href='/bbs/yxxe/hcj.asp?pid="&pid&"&amp;SessionID="& SessionID &"'>回城</a><br/>"
end if
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