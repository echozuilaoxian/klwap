<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="卸下武器装备">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
Server.ScriptTimeout=999
%>
<%
wpid=request("wpid")

if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

if wpid="w1" then
tstl="15"
wqid="wq"
yname="光芒剑"

elseif wpid="w2" then
tstl="25"
wqid="wq"
yname="战神剑"

elseif wpid="w3" then
tstl="40"
wqid="wq"
yname="天使剑"

elseif wpid="w4" then
tstl="60"
wqid="wq"
yname="黄金剑"

elseif wpid="w5" then
tstl="90"
wqid="wq"
yname="毁灭剑"

elseif wpid="w6" then
tstl="120"
wqid="wq"
yname="蝴蝶剑"

elseif wpid="w7" then
tstl="150"
wqid="wq"
yname="龙王剑"

elseif wpid="w8" then
tstl="200"
wqid="wq"
yname="轩辕煞魂斩"

elseif wpid="w9" then
tstl="400"
wqid="wq"
yname="神魔玄兵"

elseif wpid="dp" then
tstl="10"
wqid="dp"
yname="布衣"

elseif wpid="t1" then
tstl="10"
wqid="tou"
yname="光芒头盔"

elseif wpid="t2" then
tstl="20"
wqid="tou"
yname="战神头盔"

elseif wpid="t3" then
tstl="30"
wqid="tou"
yname="天使头盔"

elseif wpid="t4" then
tstl="40"
wqid="tou"
yname="黄金头盔"

elseif wpid="t5" then
tstl="50"
wqid="tou"
yname="毁灭头盔"

elseif wpid="t6" then
tstl="60"
wqid="tou"
yname="蝴蝶头盔"

elseif wpid="t7" then
tstl="70"
wqid="tou"
yname="龙王头盔"

elseif wpid="t8" then
tstl="90"
wqid="tou"
yname="轩辕圣盔"

elseif wpid="t9" then
tstl="180"
wqid="tou"
yname="神魔玄盔"

elseif wpid="tou" then
tstl="5"
wqid="tou"
yname="布料头盔"

elseif wpid="d1" then
tstl="15"
wqid="dp"
yname="光芒甲"

elseif wpid="d2" then
tstl="25"
wqid="dp"
yname="战神甲"

elseif wpid="d3" then
tstl="40"
wqid="dp"
yname="天使甲"

elseif wpid="d4" then
tstl="65"
wqid="dp"
yname="黄金甲"

elseif wpid="d5" then
tstl="90"
wqid="dp"
yname="毁灭甲"

elseif wpid="d6" then
tstl="120"
wqid="dp"
yname="蝴蝶甲"

elseif wpid="d7" then
tstl="150"
wqid="dp"
yname="龙王甲"

elseif wpid="d8" then
tstl="200"
wqid="dp"
yname="轩辕圣甲"

elseif wpid="d9" then
tstl="400"
wqid="dp"
yname="神魔玄翼"

elseif wpid="kyaa" then
tstl="5"
wqid="kyaa"
yname="布靴"

elseif wpid="k1" then
tstl="10"
wqid="kyaa"
yname="光芒靴"

elseif wpid="k2" then
tstl="20"
wqid="kyaa"
yname="战神靴"

elseif wpid="k3" then
tstl="30"
wqid="kyaa"
yname="天使靴"

elseif wpid="k4" then
tstl="40"
wqid="kyaa"
yname="黄金靴"

elseif wpid="k5" then
tstl="50"
wqid="kyaa"
yname="毁灭靴"

elseif wpid="k6" then
tstl="60"
wqid="kyaa"
yname="蝴蝶靴"

elseif wpid="k7" then
tstl="70"
wqid="kyaa"
yname="龙王靴"

elseif wpid="k8" then
tstl="90"
wqid="kyaa"
yname="轩辕圣靴"

elseif wpid="k9" then
tstl="180"
wqid="kyaa"
yname="神魔玄靴"

else
tstl="10"
wqid="wq"
yname="木剑"
end if
Server.ScriptTimeout=999
set rs8=Server.CreateObject("ADODB.Recordset")

if wqid="wq" then
wname="攻击力"
strsQL="select wq from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("wq"))
end if

if wqid="tou" then
wname="攻击力"
strsQL="select tou from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("tou"))
end if

if wqid="dp" then
wname="防守值"
strsQL="select dp from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("dp"))
end if

if wqid="kyaa" then
wname="防守值"
strsQL="select kyaa from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("kyaa"))
end if
 rs8.Close
	Set rs8=Nothing
if wqzb<1 then
msg="您没有任何武器！"
else
sql="update zb set "&wqid&"='0' where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"+1 where cstr(ids)="&ids
  conn.Execute(sql)
if wqid="wq" or wqid="tou" then
sql="update sx set gj=gj-"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
else
sql="update sx set fs=fs-"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
end if
msg="您已卸下了"&yname&","&wname&"-"&tstl&".<br/>"
end if
Response.Write ""&msg&"=========<br/>"
     Conn.Close
      Set Conn=Nothing
%>
<a href="myzb.asp?SessionID=<%=SessionID%>">[查看装备]</a><br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>