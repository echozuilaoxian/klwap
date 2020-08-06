<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="装备衣服">
<p>
<%
wpid=request("wpid")
ids=session("useid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

if wpid="d1" then
tstl="15"
dpid="2"
yname="光芒甲"
elseif wpid="d2" then
tstl="25"
dpid="3"
yname="战神甲"
elseif wpid="d3" then
tstl="40"
dpid="4"
yname="天使甲"
elseif wpid="d4" then
tstl="65"
dpid="5"
yname="黄金甲"
elseif wpid="d5" then
tstl="90"
dpid="6"
yname="毁灭甲"
elseif wpid="d6" then
tstl="120"
dpid="7"
yname="蝴蝶甲"

elseif wpid="d7" then
tstl="150"
dpid="8"
yname="龙王甲"

elseif wpid="d8" then
tstl="200"
dpid="9"
yname="轩辕圣甲"

elseif wpid="d9" then
tstl="400"
dpid="10"
yname="神魔玄翼"

else
tstl="10"
dpid="1"
yname="布料衣"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该衣服！快去<a href='tie.asp?SessionID="&SessionID&"'>李四铁铺</a>买一件吧"
else

set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))

if wpid="d2" and dengji<=2 then
msg="<img src='y/2.gif' alt='战神甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>3</u></b>级以上才可装备"
else

if wpid="d3" and dengji<=4 then
msg="<img src='y/3.gif' alt='天使甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>5</u></b>级以上才可装备"
else

if wpid="d4" and dengji<=7 then
msg="<img src='y/4.gif' alt='黄金甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>8</u></b>级以上才可装备"
else

if wpid="d5" and dengji<=9 then
msg="<img src='y/5.gif' alt='毁灭甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>10</u></b>级以上才可装备"
else

if wpid="d6" and dengji<=11 then
msg="<img src='y/6.gif' alt='蝴蝶甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>12</u></b>级以上才可装备"
else

if wpid="d7" and dengji<=15 then
msg="<img src='y/7.gif' alt='龙王甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>16</u></b>级以上才可装备"
else

if wpid="d8" and dengji<=17 then
msg="<img src='y/8.gif' alt='轩辕圣甲'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>18</u></b>级以上才可装备"
else

if wpid="d9" and dengji<=27 then
msg="<img src='y/9.gif' alt='神魔玄翼'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>28</u></b>级以上才可装备"
else

set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select dp from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
wqzb=clng(rs8("dp"))
 rs8.Close
	Set rs8=Nothing
if wqzb>0 then
msg="您已经装备了衣服，请先<a href='myzb.asp?SessionID="&SessionID&"'>卸下衣服</a>,再装备!"
else
sql="update sx set fs=fs+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update zb set dp="&dpid&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您成功装备了"&yname&",防御力增加"&tstl&"."
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
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>