<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="装备头盔">
<p>
<!--#include file="conn.asp"-->
<%
ids=session("useid")
wpid=request("wpid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
if wpid="tou" then
tstl="5"
touid="1"
yname="布料头盔"

elseif wpid="t1" then
tstl="10"
touid="2"
yname="光芒头盔"

elseif wpid="t2" then
tstl="20"
touid="3"
yname="战神头盔"

elseif wpid="t3" then
tstl="30"
touid="4"
yname="天使头盔"

elseif wpid="t4" then
tstl="40"
touid="5"
yname="黄金头盔"

elseif wpid="t5" then
tstl="50"
touid="6"
yname="毁灭头盔"

elseif wpid="t6" then
tstl="60"
touid="7"
yname="蝴蝶头盔"

elseif wpid="t7" then
tstl="70"
touid="8"
yname="龙王头盔"

elseif wpid="t9" then
tstl="180"
touid="10"
yname="神魔玄盔"

else
tstl="90"
touid="9"
yname="轩辕圣盔"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该头盔！快去<a href='tie.asp?SessionID="&SessionID&"'>李四商店</a>买一个吧<br/>"
else

set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))

if wpid="t2" and dengji<=2 then
msg="<img src='t/2.gif' alt='战神头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>3</u></b>级以上才可装备<br/>"
else

if wpid="t3" and dengji<=4 then
msg="<img src='t/3.gif' alt='天使头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>5</u></b>级以上才可装备<br/>"
else

if wpid="t4" and dengji<=7 then
msg="<img src='t/4.gif' alt='黄金头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>8</u></b>级以上才可装备<br/>"
else

if wpid="t5" and dengji<=9 then
msg="<img src='t/5.gif' alt='毁灭头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>10</u></b>级以上才可装备<br/>"
else

if wpid="t6" and dengji<=11 then
msg="<img src='t/6.gif' alt='蝴蝶头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>12</u></b>级以上才可装备<br/>"
else

if wpid="t7" and dengji<=15 then
msg="<img src='t/7.gif' alt='龙王头盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>16</u></b>级以上才可装备<br/>"
else

if wpid="t8" and dengji<=17 then
msg="<img src='t/8.gif' alt='轩辕圣盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>18</u></b>级以上才可装备<br/>"
else

if wpid="t9" and dengji<=27 then
msg="<img src='t/9.gif' alt='神魔玄盔'/><br/>等级不符.<b><u>"&yname&"</u></b>要求<b><u>28</u></b>级以上才可装备<br/>"
else

set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select tou from zb where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
kyaazb=clng(rs8("tou"))
 rs8.Close
	Set rs8=Nothing
if kyaazb>0 then
msg="您已经装备了头盔，请先<a href='myzb.asp?SessionID="&SessionID&"'>卸下头盔</a>,再装备!<br/>"
else
sql="update sx set gj=gj+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update zb set tou="&touid&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您成功装备了"&yname&",攻击力增加"&tstl&"<br/>"
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
Response.Write ""&msg&"=========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="myzb.asp?SessionID=<%=SessionID%>">[查看装备]</a><br/>
<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>