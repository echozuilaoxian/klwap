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
if pid="1" then
Response.Write "<img src='xiu1.gif' alt='修罗殿一层'/><br/>[修罗殿一层]<br/><a href='xluo2.asp?pid=1&amp;SessionID="&SessionID&"'>[-进入一层-]</a><br/>[<a href='indax.asp?pid=2&amp;SessionID="&SessionID&"'>下层</a>][上层]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料<br/>巨型号角,魔皇粉星拳,星光灭绝.情人花,及稀有的宝物"
elseif pid="2" then
Response.Write "<img src='xiu2.gif' alt='修罗殿二层'/><br/>[修罗殿二层]<br/><a href='xluo2.asp?pid=2&amp;SessionID="&SessionID&"'>[-进入二层-]</a><br/>[<a href='indax.asp?pid=3&amp;SessionID="&SessionID&"'>下层</a>][<a href='indax.asp?pid=1&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>天魔降伏,狮牙拳,积尸冥界波.及稀有的宝物"
elseif pid="3" then
Response.Write "<img src='xiu3.gif' alt='修罗殿三层'/><br/>[修罗殿三层]<br/><a href='xluo2.asp?pid=3&amp;SessionID="&SessionID&"'>[-进入三层-]</a><br/>[<a href='indax.asp?pid=4&amp;SessionID="&SessionID&"'>下层</a>][<a href='indax.asp?pid=2&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>红色毒针,黄金箭,庐山百龙霸 .情人花.及稀有的宝物"
elseif pid="4" then
Response.Write "<img src='xiu4.gif' alt='修罗殿四层'/><br/>[修罗殿四层]<br/><a href='xluo2.asp?pid=4&amp;SessionID="&SessionID&"'>[-进入四层-]</a><br/>[<a href='indax.asp?pid=5&amp;SessionID="&SessionID&"'>下层</a>][<a href='indax.asp?pid=3&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>钻石星尘,魔宫玫瑰,圣剑.情人花.及稀有的宝物"
elseif pid="5" then
Response.Write "<img src='xiu5.gif' alt='修罗殿五层'/><br/>[修罗殿五层]<br/><a href='xluo2.asp?pid=5&amp;SessionID="&SessionID&"'>[-进入五层-]</a><br/>[<a href='indax.asp?pid=6&amp;SessionID="&SessionID&"'>下层</a>][<a href='indax.asp?pid=4&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>红色毒针,黄金箭,庐山百龙霸,钻石星尘,魔宫玫瑰,圣剑.情人花.及稀有的宝物"
elseif pid="6" then
Response.Write "<img src='xiu6.gif' alt='修罗殿六层'/><br/>[修罗殿六层]<br/><a href='xluo2.asp?pid=6&amp;SessionID="&SessionID&"'>[-进入六层-]</a><br/>[<a href='indax.asp?pid=7&amp;SessionID="&SessionID&"'>下层</a>][<a href='indax.asp?pid=5&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>红色毒针,黄金箭,庐山百龙霸,钻石星尘,魔宫玫瑰,圣剑.情人花.及稀有的宝物"
else
Response.Write "<img src='xiu7.gif' alt='修罗殿七层'/><br/>[修罗殿七层]<br/><a href='xluo2.asp?pid=7&amp;SessionID="&SessionID&"'>[-进入七层-]</a><br/>[下层][<a href='indax.asp?pid=6&amp;SessionID="&SessionID&"'>上层</a>]<br/><a href='xl.asp?SessionID="&SessionID&"'>[-修罗大厅-]</a><br/>该层爆出装备合成材料:<br/>钻石星尘,魔宫玫瑰,圣剑,七彩石,珠宝粉,金刚石，及稀有的宝物"
end if
%>
<!--#include file="liao.asp"-->
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>