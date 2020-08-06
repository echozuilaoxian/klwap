<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的装备">
<p>

<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>
<%
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from zb where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("wq")="1" then
wname="<img src='w/wu.gif' alt='木剑'/><a href='xx.asp?wpid=wq&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="2" then
wname="<img src='w/1.gif' alt='光芒剑'/><a href='xx.asp?wpid=w1&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="3" then
wname="<img src='w/2.gif' alt='战神剑'/><a href='xx.asp?wpid=w2&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="4" then
wname="<img src='w/3.gif' alt='天使剑'/><a href='xx.asp?wpid=w3&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="5" then
wname="<img src='w/4.gif' alt='黄金剑'/><a href='xx.asp?wpid=w4&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="6" then
wname="<img src='w/5.gif' alt='毁灭剑'/><a href='xx.asp?wpid=w5&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="7" then
wname="<img src='w/6.gif' alt='蝴蝶剑'/><a href='xx.asp?wpid=w6&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="8" then
wname="<img src='w/7.gif' alt='龙王剑'/><a href='xx.asp?wpid=w7&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="9" then
wname="<img src='w/8.gif' alt='轩辕煞魂斩'/><a href='xx.asp?wpid=w8&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("wq")="10" then
wname="<img src='w/9.gif' alt='神魔玄兵'/><a href='xx.asp?wpid=w9&amp;SessionID="&SessionID&"'>卸下</a>"
else
wname="武器未装备"
end if

if rs("dp")="1" then
dname="<img src='y/yi.gif' alt='布衣'/><a href='xx.asp?wpid=dp&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="2" then
dname="<img src='y/1.gif' alt='光芒甲'/><a href='xx.asp?wpid=d1&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="3" then
dname="<img src='y/2.gif' alt='战神甲'/><a href='xx.asp?wpid=d2&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="4" then
dname="<img src='y/3.gif' alt='天使甲'/><a href='xx.asp?wpid=d3&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="5" then
dname="<img src='y/4.gif' alt='黄金甲'/><a href='xx.asp?wpid=d4&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="6" then
dname="<img src='y/5.gif' alt='毁灭甲'/><a href='xx.asp?wpid=d5&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="7" then
dname="<img src='y/6.gif' alt='蝴蝶甲'/><a href='xx.asp?wpid=d6&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="8" then
dname="<img src='y/7.gif' alt='龙王甲'/><a href='xx.asp?wpid=d7&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="9" then
dname="<img src='y/8.gif' alt='轩辕圣甲'/><a href='xx.asp?wpid=d8&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("dp")="10" then
dname="<img src='y/9.gif' alt='神魔玄翼'/><a href='xx.asp?wpid=d9&amp;SessionID="&SessionID&"'>卸下</a>"
else
dname="衣服未装备"
end if

if rs("kyaa")="1" then
kname="<img src='x/xue.gif' alt='布靴'/><a href='xx.asp?wpid=kyaa&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="2" then
kname="<img src='x/1.gif' alt='光芒靴'/><a href='xx.asp?wpid=k1&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="3" then
kname="<img src='x/2.gif' alt='战神靴'/><a href='xx.asp?wpid=k2&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="4" then
kname="<img src='x/3.gif' alt='天使靴'/><a href='xx.asp?wpid=k3&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="5" then
kname="<img src='x/4.gif' alt='黄金靴'/><a href='xx.asp?wpid=k4&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="6" then
kname="<img src='x/5.gif' alt='毁灭靴'/><a href='xx.asp?wpid=k5&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="7" then
kname="<img src='x/6.gif' alt='蝴蝶靴'/><a href='xx.asp?wpid=k6&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="8" then
kname="<img src='x/7.gif' alt='龙王靴'/><a href='xx.asp?wpid=k7&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="9" then
kname="<img src='x/8.gif' alt='轩辕圣靴'/><a href='xx.asp?wpid=k8&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("kyaa")="10" then
kname="<img src='x/9.gif' alt='神魔玄靴'/><a href='xx.asp?wpid=k9&amp;SessionID="&SessionID&"'>卸下</a>"
else
kname="靴子未装备"
end if
if rs("tou")="1" then
tname="<img src='t/tou.gif' alt='布料头盔'/><a href='xx.asp?wpid=tou&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="2" then
tname="<img src='t/1.gif' alt='光芒头盔'/><a href='xx.asp?wpid=t1&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="3" then
tname="<img src='t/2.gif' alt='战神头盔'/><a href='xx.asp?wpid=t2&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="4" then
tname="<img src='t/3.gif' alt='天使头盔'/><a href='xx.asp?wpid=t3&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="5" then
tname="<img src='t/4.gif' alt='黄金头盔'/><a href='xx.asp?wpid=t4&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="6" then
tname="<img src='t/5.gif' alt='毁灭头盔'/><a href='xx.asp?wpid=t5&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="7" then
tname="<img src='t/6.gif' alt='蝴蝶头盔'/><a href='xx.asp?wpid=t6&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="8" then
tname="<img src='t/7.gif' alt='龙王头盔'/><a href='xx.asp?wpid=t7&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="9" then
tname="<img src='t/8.gif' alt='轩辕圣盔'/><a href='xx.asp?wpid=t8&amp;SessionID="&SessionID&"'>卸下</a>"
elseif rs("tou")="10" then
tname="<img src='t/9.gif' alt='神魔玄盔'/><a href='xx.asp?wpid=t9&amp;SessionID="&SessionID&"'>卸下</a>"
else
tname="头盔未装备"
end if
Response.Write "" & wname & "<br/>" & tname & "<br/>" & dname & "<br/>" & kname & "<br/>"
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="mysx.asp?SessionID=<%=SessionID%>">[查看属性]</a><br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>