<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="装备武器">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
wpid=request("wpid")

if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
if wpid="w1" then
tstl="15"
wqid="2"
yname="光芒剑"
elseif wpid="w2" then
tstl="20"
wqid="3"
yname="战神剑"
elseif wpid="w3" then
tstl="40"
wqid="4"
yname="天使剑"
elseif wpid="w4" then
tstl="60"
wqid="5"
yname="黄金剑"
elseif wpid="w5" then
tstl="90"
wqid="6"
yname="毁灭剑"
elseif wpid="w6" then
tstl="120"
wqid="7"
yname="蝴蝶剑"
elseif wpid="w7" then
tstl="150"
wqid="8"
yname="龙王剑"
elseif wpid="w8" then
tstl="200"
wqid="9"
yname="轩辕煞魂斩"
elseif wpid="w9" then
tstl="400"
wqid="10"
yname="神魔玄兵"
else
tstl="10"
wqid="1"
yname="木剑"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该武器！快去<a href='tie.asp?SessionID="&SessionID&"'>李四铁铺</a>买一把吧"
else
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))

if wpid="w2" and dengji<=2 then
msg="<img src='w/2.gif' alt='战神剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>3</u></b>级以上才可装备"
else

if wpid="w3" and dengji<=4 then
msg="<img src='w/3.gif' alt='天使剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>5</u></b>级以上才可装备"
else

if wpid="w4" and dengji<=7 then
msg="<img src='w/4.gif' alt='黄金剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>8</u></b>级以上才可装备"
else

if wpid="w5" and dengji<=9 then
msg="<img src='w/5.gif' alt='毁灭剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>10</u></b>级以上才可装备"
else

if wpid="w6" and dengji<=11 then
msg="<img src='w/6.gif' alt='蝴蝶剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>12</u></b>级以上才可装备"
else

if wpid="w7" and dengji<=15 then
msg="<img src='w/7.gif' alt='龙王剑'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>16</u></b>级以上才可装备"
else

if wpid="w8" and dengji<=17 then
msg="<img src='w/8.gif' alt='轩辕煞魂斩'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>18</u></b>级以上才可装备"
else

if wpid="w9" and dengji<=27 then
msg="<img src='w/9.gif' alt='神魔玄兵'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>28</u></b>级以上才可装备"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select wq from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("wq"))
 rs8.Close
	Set rs8=Nothing
if wqzb>0 then
msg="您已经装备了武器，请先<a href='myzb.asp?SessionID="&SessionID&"'>卸下武器</a>,再装备!"
else
sql="update sx set gj=gj+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update zb set wq="&wqid&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您已装备了"&yname&",攻击力增加"&tstl&"."
END IF
end if
end if
end if
end if
end if
end if
end if
end if
end if
Response.Write ""&msg&"<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
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