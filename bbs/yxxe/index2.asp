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
<!--#include file="kyaa.asp"-->
<%
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
if rss("tl")<=1 then
Response.Write "你要注意身体啊!这么点生命值还要上山下海,你以为你是孙悟空啊?万一遇到了狼虫虎豹妖魔鬼怪,不是玩完了吗?赶快回去吧!或者你先<a href='/BBS/yxxe/yp.asp?SessionID="&SessionID&"'>加血</a>把血量提升先吧！<br/>实在不行就去<a href='/BBS/yxxe/zsm.asp?SessionID="&SessionID&"'>自杀</a>！<br/>"
else
dim suiji(75)
suiji(0)="0"
	suiji(1)="0"
	suiji(2)="0"
	suiji(3)="0"
	suiji(4)="0"
	suiji(5)="0"
	suiji(6)="1"
	suiji(7)="1"
	suiji(8)="1"
	suiji(9)="1"
	suiji(10)="2"
	suiji(11)="2"
	suiji(12)="2"
	suiji(13)="3"
	suiji(14)="3"
	suiji(15)="3"
	suiji(16)="4"
	suiji(17)="4"
	suiji(18)="4"
	suiji(19)="5"
	suiji(20)="5"
	suiji(21)="5"
	suiji(22)="6"
	suiji(23)="6"
	suiji(24)="6"
	suiji(25)="7"
	suiji(26)="7"
	suiji(27)="7"
	suiji(28)="8"
	suiji(29)="8"
	suiji(30)="8"
	suiji(31)="9"
	suiji(32)="9"
	suiji(33)="10"
	suiji(34)="10"
	suiji(35)="11"
	suiji(36)="11"
	suiji(37)="12"
	suiji(38)="12"
	suiji(39)="13"
	suiji(40)="13"
	suiji(41)="14"
	suiji(42)="14"
	suiji(43)="15"
	suiji(44)="15"
	suiji(45)="16"
	suiji(46)="16"
	suiji(47)="17"
	suiji(48)="17"
	suiji(49)="18"
	suiji(50)="18"
	suiji(51)="19"
	suiji(52)="19"
	suiji(53)="20"
	suiji(54)="20"
	suiji(55)="21"
	suiji(56)="21"
	suiji(57)="22"
	suiji(58)="22"
	suiji(59)="23"
	suiji(60)="23"
	suiji(61)="24"
	suiji(62)="24"
	suiji(63)="25"
	suiji(64)="25"
	suiji(65)="26"
	suiji(66)="26"
	suiji(67)="27"
	suiji(68)="27"
	suiji(69)="28"
	suiji(70)="28"
	suiji(71)="29"
	suiji(72)="30"
	suiji(73)="31"
	suiji(74)="32"
	suiji(75)="33"
	Randomize
	I=Int(Rnd()*75)
	mld=suiji(I)
dim suiji1(11)
        suiji1(0)="0"
	suiji1(1)="0"
	suiji1(2)="1"
	suiji1(3)="0"
	suiji1(4)="0"
	suiji1(5)="1"
	suiji1(6)="0"
	suiji1(7)="0"
	suiji1(8)="0"
	suiji1(9)="1"
	suiji1(10)="0"
	Randomize
	I=Int(Rnd()*11)
	sjid=suiji1(I)
if sjid="0" then
if pid="1" then
if mld="0" then
Response.Write "经过您的努力，您砍下了木料1棵,体力-0<br/>"
sql="update wupin set ml=ml+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "经过您的努力，您砍下了木料5棵,体力-1<br/>"
sql="update wupin set ml=ml+5 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="2" then
Response.Write "经过您的努力，您砍下了木料7棵,体力-1<br/>"
sql="update wupin set ml=ml+7 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="3" then
Response.Write "经过您的努力，您砍下了木料10棵,体力-2<br/>"
sql="update wupin set ml=ml+10 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="4" then
Response.Write "经过您的努力，您砍下了木料12棵,体力-2<br/>"
sql="update wupin set ml=ml+12 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="5" then
Response.Write "经过您的努力，您砍下了木料12棵,体力-2<br/>"
sql="update wupin set ml=ml+12 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="6" then
Response.Write "经过您的努力，您砍下了木料12棵,体力-2<br/>"
sql="update wupin set ml=ml+12 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="7" then
Response.Write "经过您的努力，您砍下了木料12棵,体力-2<br/>"
sql="update wupin set ml=ml+12 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="8" then
Response.Write "经过您的努力，您砍下了木料12棵,体力-2<br/>"
sql="update wupin set ml=ml+12 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "白百浪费力气了,树叶都没看到,更别说木头了！<br/>"
end if
Response.Write "<a href='/bbs/yxxe/index2.asp?pid=1&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>[继续伐木]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不伐木了,回去]</a><br/>"
elseif pid="2" then
if mld="0" then
Response.Write "您得到了百草丹一颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到100两银子<br/>"
sql="update wupin set yz=yz+100 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到150两银子<br/>"
sql="update wupin set yz=yz+150 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到200两银子<br/>"
sql="update wupin set yz=yz+200 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到宝石一个！<br/>"
sql="update wupin set bs=bs+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到轩辕头盔一个！<br/>"
sql="update wupin set t8=t8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "您得到战神头盔一个！<br/>"
sql="update wupin set t2=t2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="8" then
Response.Write "您得到战神靴一件！<br/>"
sql="update wupin set k2=k2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="9" then
Response.Write "您得到天使剑一把！<br/>"
sql="update wupin set w3=w3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="10" then
Response.Write "您得到天使头盔一个！<br/>"
sql="update wupin set t3=t3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="11" then
Response.Write "您得到天使甲一件！<br/>"
sql="update wupin set d3=d3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="12" then
Response.Write "您得到天使靴一件！<br/>"
sql="update wupin set k3=k3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="13" then
Response.Write "[恭喜]<br/>您得到黄金剑一把！<br/>"
sql="update wupin set w4=w4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="14" then
Response.Write "[恭喜]<br/>您得到黄金头盔一个！<br/>"
sql="update wupin set t4=t4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="15" then
Response.Write "[恭喜]<br/>您得到黄金甲一件！<br/>"
sql="update wupin set d4=d4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="16" then
Response.Write "[恭喜]<br/>您得到龙王剑一把！<br/>"
sql="update wupin set w7=w7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="17" then
Response.Write "[恭喜]<br/>您得到毁灭剑一把！<br/>"
sql="update wupin set w5=w5+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="18" then
Response.Write "[恭喜]<br/>您得到毁灭头盔一个！<br/>"
sql="update wupin set t5=t5+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="19" then
Response.Write "[恭喜]<br/>您得到毁灭甲一件！<br/>"
sql="update wupin set d5=d5+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="20" then
Response.Write "[恭喜]<br/>您得到毁灭靴一件！<br/>"
sql="update wupin set k5=k5+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="21" then
Response.Write "[恭喜]<br/>您得到情人花一朵！<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="22" then
Response.Write "[恭喜]<br/>您得到蝴蝶头盔一个！<br/>"
sql="update wupin set t6=t6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="23" then
Response.Write "[恭喜]<br/>您得到蝴蝶甲一件！<br/>"
sql="update wupin set d6=d6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="24" then
Response.Write "[恭喜]<br/>您得到蝴蝶靴一件！<br/>"
sql="update wupin set k6=k6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="25" then
Response.Write "[恭喜]<br/>您得到黄金靴一件！<br/>"
sql="update wupin set k4=k4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="26" then
Response.Write "[恭喜]<br/>您得到龙王头盔一个！<br/>"
sql="update wupin set t7=t7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="27" then
Response.Write "[-恭喜-]<br/>您得到轩辕煞魂斩一把！<br/>"
sql="update wupin set w8=w8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="28" then
Response.Write "[恭喜]<br/>您得到龙王靴一件！<br/>"
sql="update wupin set k7=k7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="29" then
Response.Write "[恭喜]<br/>您得到龙王甲一件！<br/>"
sql="update wupin set d7=d7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="30" then
Response.Write "[-恭喜-]<br/>您得到轩辕头盔一个！<br/>"
sql="update wupin set t8=t8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="31" then
Response.Write "[-恭喜-]<br/>您得到轩辕圣甲一件！<br/>"
sql="update wupin set d8=d8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="32" then
Response.Write "[-恭喜-]<br/>您得到轩辕圣靴一件！<br/>"
sql="update wupin set k8=k8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "[-恭喜-]<br/>您得到轩辕头盔一个！<br/>"
sql="update wupin set t8=t8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/index2.asp?pid=2&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>[继续寻宝]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不寻宝了,回去]</a><br/>"
elseif pid="3" then
if mld="0" then
Response.Write "经过您的努力，您挖到瓶药水,体力-1<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "经过您的努力，您挖到了锡一块,体力-1<br/>"
sql="update wupin set j1=j1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "经过您的努力，您挖到了铜一块,体力-1<br/>"
sql="update wupin set j2=j2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "经过您的努力，您挖到了银一块,体力-1<br/>"
sql="update wupin set j3=j3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "经过您的努力，您挖到了金一块,体力-1<br/>"
sql="update wupin set j4=j4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="5" then
Response.Write "经过您的努力，您挖到了金一块,体力-1<br/>"
sql="update wupin set j4=j4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "经过您的努力，您挖到了金一块,体力-1<br/>"
sql="update wupin set j4=j4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "经过您的努力，您挖到了金一块,体力-1<br/>"
sql="update wupin set j4=j4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="8" then
Response.Write "经过您的努力，您挖到了金一块,体力-1<br/>"
sql="update wupin set j4=j4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="9" then
Response.Write "经过您的努力，您挖到了金二块,体力-1<br/>"
sql="update wupin set j4=j4+2 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="19" then
Response.Write "经过您的努力，您挖到了金五块,体力-1<br/>"
sql="update wupin set j4=j4+5 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

else
Response.Write "经过您的努力，您挖到了锡一块,体力-1<br/>"
sql="update wupin set j1=j1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/index2.asp?pid=3&amp;?t=" & time() & "&amp;SessionID=" & SessionID & "'>[继续挖矿]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不挖矿了,回去]</a><br/>"
else
if mld="0" then
Response.Write "您得到了一瓶药水!<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您钓上了一条小虾<br/>"
sql="update wupin set h1=h1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您钓上了一条鲤鱼<br/>"
sql="update wupin set h2=h2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您钓上了一只螃蟹<br/>"
sql="update wupin set h3=h3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="4" then
Response.Write "您钓上了一只大水鱼<br/>"
sql="update wupin set h4=h4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "您钓上了一条鲤鱼<br/>"
sql="update wupin set h2=h2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "您钓上了一只螃蟹<br/>"
sql="update wupin set h3=h3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "您钓上了一只大水鱼<br/>"
sql="update wupin set h4=h4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="8" then
Response.Write "您钓上了一条鲤鱼<br/>"
sql="update wupin set h2=h2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="9" then
Response.Write "您钓上了一只螃蟹<br/>"
sql="update wupin set h3=h3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="10" then
Response.Write "您钓上了一只大水鱼<br/>"
sql="update wupin set h4=h4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="11" then
Response.Write "您钓上了一条鲤鱼<br/>"
sql="update wupin set h2=h2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="12" then
Response.Write "您钓上了一只螃蟹<br/>"
sql="update wupin set h3=h3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您钓上了一条小虾<br/>"
sql="update wupin set h1=h1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/index2.asp?pid=4&amp;t=" & time() & "&amp;SessionID=" &SessionID & "'>[继续钓鱼]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不钓鱼了,回去]</a><br/>"
end if
else
response.redirect "/bbs/yxxe/pk.asp?pid="&pid&"&SessionID="&SessionID&""
end if
end if
      Set rss=Nothing
     Conn.Close
      Set Conn=Nothing
%>
=========<br/>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>