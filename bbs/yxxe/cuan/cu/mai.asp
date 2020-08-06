<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="取出物品">  
<p align="left">
<anchor><prev/>[-返回-]</anchor><br/>
<%
wpid=request("wpid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
Select Case wpid
Case "wq" 
itidtit="木剑"

danwei="把"
Case "hcj" 
itidtit="回城卷"

danwei="个"
Case "w1" 
itidtit="光芒剑"

danwei="把"
Case "w2" 
itidtit="战神剑"

danwei="把"
Case "w3" 
itidtit="天使剑"

danwei="把"
Case "w4" 
itidtit="黄金剑"

danwei="把"
Case "w5" 
itidtit="毁灭剑"

danwei="把"
Case "w6" 
itidtit="蝴蝶剑"

danwei="把"
Case "w7" 
itidtit="龙王剑"

danwei="把"
Case "w8" 
itidtit="轩辕煞魂斩"

danwei="把"
Case "dp" 
itidtit="布衣"

danwei="件"
Case "d1" 
itidtit="光芒甲"

danwei="件"
Case "d2" 
itidtit="战神甲"

danwei="件"
Case "d3" 
itidtit="天使甲"

danwei="件"
Case "d4" 
itidtit="黄金甲"

danwei="件"
Case "d5" 
itidtit="毁灭甲"

danwei="件"
Case "d6" 
itidtit="蝴蝶甲"

danwei="件"
Case "d7" 
itidtit="龙王甲"

danwei="件"
Case "d8" 
itidtit="轩辕圣甲"

danwei="件"
Case "kyaa" 
itidtit="布料靴"

danwei="件"
Case "k1" 
itidtit="光芒靴"

danwei="件"
Case "k2" 
itidtit="战神靴"

danwei="件"
Case "k3" 
itidtit="天使靴"

danwei="件"
Case "k4" 
itidtit="黄金靴"

danwei="件"
Case "k5" 
itidtit="毁灭靴"

danwei="件"
Case "k6" 
itidtit="蝴蝶靴"

danwei="件"
Case "k7" 
itidtit="龙王靴"

danwei="件"
Case "k8" 
itidtit="轩辕圣靴"

danwei="件"
Case "tou" 
itidtit="布料头盔"

danwei="件"
Case "t1" 
itidtit="光芒头盔"

danwei="件"

itidtit="战神头盔"

danwei="件"
Case "t3" 
itidtit="天使头盔"

danwei="件"
Case "t4" 
itidtit="黄金头盔"

danwei="件"
Case "t5" 
itidtit="毁灭头盔"

danwei="件"
Case "t6" 
itidtit="蝴蝶头盔"

danwei="件"
Case "t7" 
itidtit="龙王头盔"

danwei="件"
Case "t8" 
itidtit="轩辕圣盔"

danwei="件"
Case "y1" 
itidtit="百草丹"

danwei="颗"
Case "y2" 
itidtit="大力神丹"

danwei="颗"
Case "y3" 
itidtit="九转还魂丹"

danwei="颗"
Case "y4" 
itidtit="少林大还丹"

danwei="颗"
Case "y5" 
itidtit="江湖强力魔水"

danwei="颗"
Case "y6" 
itidtit="情人花"

danwei="朵"
Case "bs" 
itidtit="宝石"
danwei="颗"

Case "h1"
     itidtit="小虾"
danwei="条"

   Case "h2"
     itidtit="鲤鱼"
danwei="条"

   Case "h3"
     itidtit="螃蟹"
danwei="只"

   Case "h4"
     itidtit="大水鱼"
danwei="只"

   Case "j1"
     itidtit="锡"
danwei="块"

   Case "j2"
     itidtit="铜"
danwei="块"

   Case "j3"
     itidtit="银"
danwei="块"

   Case "j4"
     itidtit="金"
danwei="块"

Case "ml" 
itidtit="木料"

danwei="棵"
 End Select

Response.Write "管家对您说：主人，请问您要取出多少" & danwei & "？<br/>"
%>
<img src='/BBS/yxxe/1.gif' alt='------------'/><br/>
你说：<br/>我要取:<input name="num" size="3" format="*N"/><%=danwei%>
<br/>
<anchor>帮我拿好了哦
<go method="post" href="dan1.asp?SessionID=<%=SessionID%>">
<postfield name="did" value="<%=wpid%>"/>
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
------------<br/>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p>
</card>
</wml>
