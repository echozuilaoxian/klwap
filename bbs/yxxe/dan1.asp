﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="陈六当铺">
<p>
<%
Server.ScriptTimeout=999
did=request("did")
num=request("num")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?did="&did&"&num="&num&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Select Case did
Case "wq" 
itidtit="木剑"
jiage="80"
danwei="把"
Case "hcj" 
itidtit="回城卷"
jiage="20"
danwei="个"
Case "w1" 
itidtit="光芒剑"
jiage="160"
danwei="把"
Case "w2" 
itidtit="战神剑"
jiage="400"
danwei="把"
Case "w3" 
itidtit="天使剑"
jiage="800"
danwei="把"
Case "w4" 
itidtit="黄金剑"
jiage="1300"
danwei="把"
Case "w5" 
itidtit="毁灭剑"
jiage="1900"
danwei="把"
Case "w6" 
itidtit="蝴蝶剑"
jiage="2500"
danwei="把"
Case "w7" 
itidtit="龙王剑"
jiage="8000"
danwei="把"
Case "w8" 
itidtit="轩辕煞魂斩"
jiage="100000"
danwei="把"
Case "dp" 
itidtit="布衣"
jiage="80"
danwei="件"
Case "d1" 
itidtit="光芒甲"
jiage="160"
danwei="件"
Case "d2" 
itidtit="战神甲"
jiage="300"
danwei="件"
Case "d3" 
itidtit="天使甲"
jiage="600"
danwei="件"
Case "d4" 
itidtit="黄金甲"
jiage="1000"
danwei="件"
Case "d5" 
itidtit="毁灭甲"
jiage="1500"
danwei="件"
Case "d6" 
itidtit="蝴蝶甲"
jiage="2100"
danwei="件"
Case "d7" 
itidtit="龙王甲"
jiage="8000"
danwei="件"
Case "d8" 
itidtit="轩辕圣甲"
jiage="100000"
danwei="件"
Case "kyaa" 
itidtit="布料靴"
jiage="80"
danwei="件"
Case "k1" 
itidtit="光芒靴"
jiage="120"
danwei="件"
Case "k2" 
itidtit="战神靴"
jiage="300"
danwei="件"
Case "k3" 
itidtit="天使靴"
jiage="600"
danwei="件"
Case "k4" 
itidtit="黄金靴"
jiage="1000"
danwei="件"
Case "k5" 
itidtit="毁灭靴"
jiage="1500"
danwei="件"
Case "k6" 
itidtit="蝴蝶靴"
jiage="2100"
danwei="件"
Case "k7" 
itidtit="龙王靴"
jiage="8000"
danwei="件"
Case "k8" 
itidtit="轩辕圣靴"
jiage="100000"
danwei="件"
Case "tou" 
itidtit="布料头盔"
jiage="80"
danwei="件"
Case "t1" 
itidtit="光芒头盔"
jiage="120"
danwei="件"
Case "t2" 
itidtit="战神头盔"
jiage="300"
danwei="件"
Case "t3" 
itidtit="天使头盔"
jiage="600"
danwei="件"
Case "t4" 
itidtit="黄金头盔"
jiage="1000"
danwei="件"
Case "t5" 
itidtit="毁灭头盔"
jiage="1500"
danwei="件"
Case "t6" 
itidtit="蝴蝶头盔"
jiage="2100"
danwei="件"
Case "t7" 
itidtit="龙王头盔"
jiage="8000"
danwei="件"
Case "t8" 
itidtit="轩辕圣盔"
jiage="100000"
danwei="件"
Case "y1" 
itidtit="百草丹"
jiage="80"
danwei="颗"
Case "y2" 
itidtit="大力神丹"
jiage="160"
danwei="颗"
Case "y3" 
itidtit="九转还魂丹"
jiage="400"
danwei="颗"
Case "y4" 
itidtit="少林大还丹"
jiage="800"
danwei="颗"
Case "y5" 
itidtit="江湖强力魔水"
jiage="80000"
danwei="颗"
Case "y6" 
itidtit="情人花"
jiage="80000"
danwei="朵"
Case "bs" 
itidtit="宝石"
danwei="颗"
jiage="80000"
Case "h1"
     itidtit="小虾"
danwei="条"
jiage="80"
   Case "h2"
     itidtit="鲤鱼"
danwei="条"
jiage="160"
   Case "h3"
     itidtit="螃蟹"
danwei="只"
jiage="300"
   Case "h4"
     itidtit="大水鱼"
danwei="只"
jiage="500"
   Case "j1"
     itidtit="锡"
danwei="块"
jiage="80"
   Case "j2"
     itidtit="铜"
danwei="块"
jiage="160"
   Case "j3"
     itidtit="银"
danwei="块"
jiage="240"
   Case "j4"
     itidtit="金"
danwei="块"
jiage="480"
Case "ml" 
itidtit="木料"
jiage="20"
danwei="棵"
 End Select
ids=session("useid")

jinq=jiage*num
if request("caozuo")="" then
Response.Write "您要当的是"&num&""&danwei&""&itidtit&",一共银两"&jinq&"两,要当吗？<br/>你说：<br/><a href='dan1.asp?caozuo=ok&amp;did="&did&"&amp;num="&num&"&amp;SessionID="&SessionID&"'>成了!多少就多少!</a><br/><a href='index.asp?SessionID="&SessionID&"'>这么丁点钱,不当了!</a><br/>"
else %>
<!--#include file="conn.asp"-->
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&did&" from wupin where cstr(ids)="&ids
rs.open strsQL,Conn,1,1
if clng(num)>rs(""&did&"") then
msg="您只有"&rs(""&did&"")&""&danwei&""&itidtit&",哪有这么多卖！是不是想钱想傻了啊！"
else
sql="update wupin set "&did&"="&did&"-"&num&",yz=yz+"&jinq&" where cstr(ids)="&ids
  conn.Execute(sql)
msg="您卖了"&num&""&danwei&""&itidtit&",得到银两"&jinq&"两！"
end if
Response.Write ""&msg&"<br/><a href='dan.asp?SessionID="&SessionID&"'>继续交易</a><br/>"
 rs.Close
	Set rs=Nothing
Conn.Close
      Set Conn=Nothing
end if
Response.Write "--------<br/><a href='bang.asp?SessionID="&SessionID&"'>魔法</a>|<a href='myzb.asp?SessionID="&SessionID&"'>装备</a>|<a href='mysx.asp?SessionID="&SessionID&"'>属性</a>|<a href='mywp.asp?SessionID="&SessionID&"'>行囊</a><br/>随身地图:<br/><a href='tie.asp?SessionID="&SessionID&"'>商店</a>|<a href='ke.asp?SessionID="&SessionID&"'>客栈</a>|<a href='yao.asp?SessionID="&SessionID&"'>药铺</a><br/><a href='index1.asp?pid=1&amp;SessionID="&SessionID&"'>原始森林</a><br/><a href='index1.asp?pid=2&amp;SessionID="&SessionID&"'>魔鬼山洞</a><br/><a href='index1.asp?pid=3&amp;SessionID="&SessionID&"'>丰富矿山</a><br/><a href='index1.asp?pid=4&amp;SessionID="&SessionID&"'>浩瀚北海</a><br/>--------<br/>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>