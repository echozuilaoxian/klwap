<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="装备靴子">
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
if wpid="kyaa" then
tstl="5"
kyaaid="1"
yname="布料靴"

elseif wpid="k1" then
tstl="10"
kyaaid="2"
yname="光芒靴"

elseif wpid="k2" then
tstl="20"
kyaaid="3"
yname="战神靴"

elseif wpid="k3" then
tstl="30"
kyaaid="4"
yname="天使靴"

elseif wpid="k4" then
tstl="40"
kyaaid="5"
yname="黄金靴"

elseif wpid="k5" then
tstl="50"
kyaaid="6"
yname="毁灭靴"

elseif wpid="k6" then
tstl="60"
kyaaid="7"
yname="蝴蝶靴"

elseif wpid="k7" then
tstl="70"
kyaaid="8"
yname="龙王靴"

elseif wpid="k9" then
tstl="180"
kyaaid="10"
yname="神魔玄靴"

else
tstl="90"
kyaaid="9"
yname="轩辕圣靴"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该靴子！快去<a href='tie.asp?SessionID="&SessionID&"'>李四商店</a>买一双吧"
else

set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))

if wpid="k2" and dengji<=2 then
msg="<img src='x/2.gif' alt='战神靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>3</u></b>级以上才可装备"
else

if wpid="k3" and dengji<=4 then
msg="<img src='x/3.gif' alt='天使靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>5</u></b>级以上才可装备"
else

if wpid="k4" and dengji<=7 then
msg="<img src='x/4.gif' alt='黄金靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>8</u></b>级以上才可装备"
else

if wpid="k5" and dengji<=9 then
msg="<img src='x/5.gif' alt='毁灭靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>10</u></b>级以上才可装备"
else

if wpid="k6" and dengji<=11 then
msg="<img src='x/6.gif' alt='蝴蝶靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>12</u></b>级以上才可装备"
else

if wpid="k7" and dengji<=15 then
msg="<img src='x/7.gif' alt='龙王靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>16</u></b>级以上才可装备"
else

if wpid="k8" and dengji<=17 then
msg="<img src='x/8.gif' alt='轩辕圣靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>18</u></b>级以上才可装备"
else

if wpid="k9" and dengji<=27 then
msg="<img src='x/9.gif' alt='神魔玄靴'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>28</u></b>级以上才可装备"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select kyaa from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
kyaazb=clng(rs8("kyaa"))
 rs8.Close
	Set rs8=Nothing
if kyaazb>0 then
msg="您已经装备了靴子，请先<a href='myzb.asp?SessionID="&SessionID&"'>卸下靴子</a>,再装备!"
else
sql="update sx set fs=fs+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update zb set kyaa="&kyaaid&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您成功装备"&yname&",防御力增加"&tstl&"."
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