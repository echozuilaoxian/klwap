<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<!--#include file="conn.asp"-->
<%
if SessionID="" then SessionID=Session("SessionID")
wpid=request("wpid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
gfjf=clng(request("wnum"))
useid=clng(request("useid"))
dim wpid,ltlyuan,ltlyuans
Select Case wpid
   Case "hw1"
      wname="巨型号角"
   Case "hw2"
      wname="星光灭绝"
   Case "hw3"
      wname="魔皇粉星拳"

   Case "hw4"
      wname="积尸冥界波"
   Case "hw5"
      wname="天魔降伏"
   Case "hw6"
      wname="狮牙拳"

   Case "hw7"
      wname="庐山百龙霸"
   Case "hw8"
      wname="红色毒针"
   Case "hw9"
      wname="黄金箭"

   Case "hw10"
      wname="圣剑"
   Case "hw11"
      wname="钻石星尘"
   Case "hw12"
      wname="魔宫玫瑰"

   Case "hw13"
      wname="七彩石"
   Case "hw14"
      wname="珠宝粉"
   Case "hw15"
      wname="金刚石"

   Case "y1"
      wname="百草丹"
   Case "hcj"
      wname="回城卷"
   Case "y2"
      wname="大力神丹"
   Case "y3" 
      wname="九转还魂丹"  
   Case "y4"
      wname="少林大还丹"
   Case "y5"
      wname="江湖强力魔水"
   Case "wq"
     wname="木剑"
   Case "w1"
     wname="光芒剑"
   Case "w2"
     wname="战神剑"
   Case "w3"
     wname="天使剑"
   Case "w4"
     wname="黄金剑"
   Case "w5"
     wname="毁灭剑"
   Case "w6"
     wname="蝴蝶剑"
   Case "w7"
     wname="龙王剑"
   Case "w8"
     wname="轩辕煞魂斩"
   Case "dp"
     wname="布衣"
   Case "d1"
     wname="光芒甲"
   Case "d2"
     wname="战神甲"
   Case "d3"
     wname="天使甲"
   Case "d4"
     wname="黄金甲"
   Case "d5"
     wname="毁灭甲"
   Case "d6"
     wname="蝴蝶甲"
   Case "d7"
     wname="龙王甲"
   Case "d8"
     wname="轩辕圣甲"
   Case "kyaa"
     wname="布靴"
   Case "k1"
     wname="光芒靴"
   Case "k2"
     wname="战神靴"
   Case "k3"
     wname="天使靴"
   Case "k4"
     wname="黄金靴"
   Case "k5"
     wname="毁灭靴"
   Case "k6"
     wname="蝴蝶靴"
   Case "k7"
     wname="龙王靴"
   Case "k8"
     wname="轩辕圣靴"
   Case "tou"
     wname="布料头盔"
   Case "t1"
     wname="光芒头盔"
   Case "t2"
     wname="战神头盔"
   Case "t3"
     wname="天使头盔"
   Case "t4"
     wname="黄金头盔"
   Case "t5"
     wname="毁灭头盔"
   Case "t6"
     wname="蝴蝶头盔"
   Case "t7"
     wname="龙王头盔"
   Case "t8"
     wname="轩辕圣盔"
   Case "h1"
     wname="小虾"
   Case "h2"
     wname="鲤鱼"
   Case "h3"
     wname="螃蟹"
   Case "h4"
     wname="大水鱼"
   Case "j1"
     wname="锡"
   Case "j2"
     wname="铜"
   Case "j3"
     wname="银"
   Case "j4"
     wname="金"
   Case "ml"
     wname="木料"
   Case "bs"
     wname="宝石"
   Case "yz"
     wname="银子"
   Case "mm1"
     wname="圣盾术"
   Case "mm2"
     wname="烈火术"
   Case "mm3"
     wname="瞬移术"
   Case "mm4"
     wname="刺杀术"
end Select 
%>
<card id="card1" title="赠送[<%=wname%>]给ID:<%=useid%>"><p>
<%
if useid=iduse then
response.write "你怎么送给自己啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
if useid="" then
response.write "你送给谁也不说，怎么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
if gfjf="" then
response.write "你送多少给人家也不说，怎么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
set rs=Server.CreateObject("ADODB.Recordset")
sql="select "&wpid&" from wupin where cstr(ids)='"&iduse& "'"
rs.open sql,conn
if rs.eof then
response.write "你还没有"&wname&",拿什么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
if gfjf<0 or gfjf>rs(""&wpid&"") then
            msg="您的"&wname&"不够赠送数量!<br/><anchor><prev/>返回</anchor>"    
   else
   sql="update wupin set "&wpid&"="&wpid&"-"&gfjf&" Where CStr(ids)="&iduse
            conn.execute(sql)
   sql="update wupin set "&wpid&"="&wpid&"+"&gfjf&" Where CStr(ids)="&useid
            conn.execute(sql)

rs.close
set rs=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<%
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="恭喜！[u]" & gfdsa & "ID:" & iduse & "[/u]赠送《江湖》物品["&wname&"]数量["&gfjf&"]给你,这是系统信息,请勿回复以及转发!"
rsll("ids")=useid
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing
          msg="赠送成功!<br/>成功赠送["&wname&"]数量["&gfjf&"]给ID:"&useid&"<br/>系统已发信通知对方。"
           end if

conn=close
set conn=nothing
 response.write msg
%>
<br/>--------<br/>
<a href="/bbs/yxxe/mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p></card></wml>