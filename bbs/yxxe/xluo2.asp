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
<!--#include file="kyaa.asp"-->
<%
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))
if pid="2" and dengji<=9 then
Response.Write "修罗殿二层等级低于<b><u>10</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="3" and dengji<=14 then
Response.Write "修罗殿三层等级低于<b><u>15</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="4" and dengji<=19 then
Response.Write "修罗殿四层等级低于<b><u>20</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="5" and dengji<=24 then
Response.Write "修罗殿五层等级低于<b><u>25</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="6" and dengji<=29 then
Response.Write "修罗殿六层等级低于<b><u>30</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if pid="7" and dengji<=34 then
Response.Write "修罗殿七层等级低于<b><u>35</u></b>级不能进入<br/>里面的怪物攻击力威力无比，保命要紧！你还是去别的地方吧。<br/><a href='/bbs/yxxe/xl.asp?SessionID="&SessionID&"'>修罗大厅</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>江湖首页</a></p></card></wml>"
response.end
end if
if rss("tl")<=1 then
Response.Write "体力不足无法进入.<br/><a href='/bbs/yxxe/yp.asp?SessionID="&SessionID&"'>喝药</a>把血量提升先吧！<br/>实在不行就去<a href='/bbs/yxxe/zsm.asp?SessionID="&SessionID&"'>自杀</a><br/>"
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
Response.Write "您得到物品:<b><u>百草丹</u></b><br/>数量:1 颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>巨型号角</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw1=hw1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>星光灭绝</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw2=hw2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>魔皇粉星拳</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw3=hw3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="31" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您得到180两银子<br/>"
sql="update wupin set yz=yz+180 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=1&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"
elseif pid="2" then
if mld="0" then
Response.Write "您得到物品:<b><u>百草丹</u></b><br/>数量:1 颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>积尸冥界波</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw4=hw4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>天魔降伏</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw5=hw5+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>狮牙拳</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw6=hw6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="31" then
Response.Write "[-恭喜-]<br/>您得到轩辕圣甲一件！<br/>"
sql="update wupin set d8=d8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="33" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您得到180两银子<br/>"
sql="update wupin set yz=yz+180 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=2&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"

elseif pid="3" then
if mld="0" then
Response.Write "您得到物品:<b><u>百草丹</u></b><br/>数量:1 颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>庐山百龙霸</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw7=hw7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>红色毒针</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw8=hw8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>黄金箭</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw9=hw9+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="27" then
Response.Write "[-恭喜-]<br/>您得到轩辕煞魂斩一把！<br/>"
sql="update wupin set w8=w8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您得到8两银子<br/>"
sql="update wupin set yz=yz+8 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=3&amp;?t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"
elseif pid="4" then
if mld="0" then
Response.Write "您得到物品:<b><u>百草丹</u></b><br/>数量:1 颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>圣剑</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw10=hw10+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>钻石星尘</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw11=hw11+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>魔宫玫瑰</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw12=hw12+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="32" then
Response.Write "[-恭喜-]<br/>您得到轩辕圣靴一件！<br/>"
sql="update wupin set k8=k8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="31" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您得到8两银子<br/>"
sql="update wupin set yz=yz+8 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=4&amp;?t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"
elseif pid="5" then
if mld="0" then
Response.Write "您得到了百草丹一颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>庐山百龙霸</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw7=hw7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>红色毒针</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw8=hw8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>黄金箭</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw9=hw9+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="24" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>圣剑</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw10=hw10+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="25" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>钻石星尘</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw11=hw11+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="26" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>魔宫玫瑰</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw12=hw12+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="28" then
Response.Write "[-恭喜-]<br/>您得到江湖强力魔水一个！<br/>"
sql="update wupin set y8=y8+1 where cstr(ids)='"&ids& "'"
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
elseif mld="33" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您得到8两银子<br/>"
sql="update wupin set yz=yz+8 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=5&amp;?t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"

elseif pid="6" then
if mld="0" then
Response.Write "您得到了百草丹一颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>庐山百龙霸</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw7=hw7+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>红色毒针</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw8=hw8+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>黄金箭</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw9=hw9+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="24" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>圣剑</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw10=hw10+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="25" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>钻石星尘</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw11=hw11+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="26" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>魔宫玫瑰</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw12=hw12+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="27" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="28" then
Response.Write "[-恭喜-]<br/>您得到江湖强力魔水一个！<br/>"
sql="update wupin set y8=y8+1 where cstr(ids)='"&ids& "'"
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
Response.Write "您得到8两银子<br/>"
sql="update wupin set yz=yz+8 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=6&amp;?t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"

else
if mld="0" then
Response.Write "您得到了百草丹一颗<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="1" then
Response.Write "您得到50两银子<br/>"
sql="update wupin set yz=yz+50 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您得到60两银子<br/>"
sql="update wupin set yz=yz+60 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="3" then
Response.Write "您得到55两银子<br/>"
sql="update wupin set yz=yz+55 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="4" then
Response.Write "您得到70两银子<br/>"
sql="update wupin set yz=yz+70 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="5" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>七彩石</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw13=hw13+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="6" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>珠宝粉</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw14=hw14+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="7" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>金刚石</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw15=hw15+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="24" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>圣剑</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw10=hw10+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="25" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>钻石星尘</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw11=hw11+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="26" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>魔宫玫瑰</u></b>！<br/>数量:1 本<br/>"
sql="update wupin set hw12=hw12+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="27" then
Response.Write "[-恭喜-]<br/>您得到<br/>物品:<b><u>情人花</u></b>！<br/>数量:1 朵<br/>"
sql="update wupin set y6=y6+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)

elseif mld="28" then
Response.Write "[-恭喜-]<br/>您得到江湖强力魔水一个！<br/>"
sql="update wupin set y8=y8+1 where cstr(ids)='"&ids& "'"
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
Response.Write "您得到8两银子<br/>"
sql="update wupin set yz=yz+8 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='/bbs/yxxe/xluo2.asp?pid=7&amp;t=" & time() & "&amp;SessionID="&SessionID&"'>[继续前行]</a><br/><a href='/bbs/yxxe/index.asp?SessionID="&SessionID&"'>[不去了]</a><br/>"
end if
else
response.redirect "/bbs/yxxe/xluo.asp?pid="&pid&"&SessionID="&SessionID&""
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