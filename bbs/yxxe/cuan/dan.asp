<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
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
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pp="&pp&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
pp=request("pp")
%>
告示：<br/>本店童叟无欺,现银支付！<br/>陈六：这位少侠，请问有什么要当的？<br/>
<select name="did" value="<%=pp%>">
<option value="ml">木料</option>
<option value="wq">木剑</option>
<option value="w1">光芒剑</option>
<option value="w2">战神剑</option>
<option value="w3">天使剑</option>
<option value="w4">黄金剑</option>
<option value="w5">毁灭剑</option>
<option value="w6">蝴蝶剑</option>
<option value="w7">龙王剑</option>
<option value="w8">轩辕煞魂斩</option>
<option value="dp">布料衣</option>
<option value="d1">光芒甲</option>
<option value="d2">战神甲</option>
<option value="d3">天使甲</option>
<option value="d4">黄金甲</option>
<option value="d5">毁灭甲</option>
<option value="d6">蝴蝶甲</option>
<option value="d7">龙王甲</option>
<option value="d8">轩辕圣甲</option>
<option value="kyaa">布料靴</option>
<option value="k1">光芒靴</option>
<option value="k2">战神靴</option>
<option value="k3">天使靴</option>
<option value="k4">黄金靴</option>
<option value="k5">毁灭靴</option>
<option value="k6">蝴蝶靴</option>
<option value="k7">龙王靴</option>
<option value="k8">轩辕圣靴</option>
<option value="tou">布料头盔</option>
<option value="t1">光芒头盔</option>
<option value="t2">战神头盔</option>
<option value="t3">天使头盔</option>
<option value="t4">黄金头盔</option>
<option value="t5">毁灭头盔</option>
<option value="t6">蝴蝶头盔</option>
<option value="t7">龙王头盔</option>
<option value="t8">轩辕圣盔</option>
<option value="y1">百草丹</option>
<option value="y2">大力神丹</option>
<option value="y3">九转还魂丹</option>
<option value="y4">少林大还丹</option>
<option value="y5">江湖强力魔水</option>
<option value="y6">情人花</option>
<option value="bs">宝石</option>
<option value="h1">小虾</option> 
<option value="h2">鲤鱼</option> 
<option value="h3">螃蟹</option> 
<option value="h4">大水鱼</option>
<option value="j1">锡</option> 
<option value="j2">铜</option> 
<option value="j3">银</option> 
<option value="j4">金</option> 
</select><br/>
要当多少数量：<br/><input name="num" format="*N"/>
<br/><anchor>查看一共多少银两<go method="post" href="dan1.asp?SessionID=<%=SessionID%>"><postfield name="did" value="$(did)"/><postfield name="num" value="$(num)"/></go></anchor><br/>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/liao.asp"-->

<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>