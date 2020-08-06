<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="李四铁铺">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
Server.ScriptTimeout=999
wpid=request("wid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%

if wpid="1" then
yname="光芒剑"
xyyz="200"
tname="w1"
elseif wpid="2" then
yname="战神剑"
xyyz="500"
tname="w2"
elseif wpid="3" then
yname="天使剑"
xyyz="1000"
tname="w3"
elseif wpid="4" then
yname="黄金剑"
xyyz="1650"
tname="w4"
elseif wpid="5" then
yname="毁灭剑"
xyyz="2400"
tname="w5"
elseif wpid="6" then
yname="蝴蝶剑"
xyyz="3000"
tname="w6"
elseif wpid="7" then
yname="龙王剑"
xyyz="10000"
tname="w7"

elseif wpid="8" then
yname="光芒甲"
xyyz="200"
tname="d1"

elseif wpid="9" then
yname="战神甲"
xyyz="400"
tname="d2"

elseif wpid="10" then
yname="天使甲"
xyyz="750"
tname="d3"

elseif wpid="11" then
yname="黄金甲"
xyyz="1200"
tname="d4"

elseif wpid="12" then
yname="毁灭甲"
xyyz="1800"
tname="d5"

elseif wpid="13" then
yname="蝴蝶甲"
xyyz="2500"
tname="d6"

elseif wpid="14" then
yname="龙王甲"
xyyz="10000"
tname="d7"

elseif wpid="15" then
yname="光芒靴"
xyyz="200"
tname="k1"

elseif wpid="16" then
yname="战神靴"
xyyz="400"
tname="k2"

elseif wpid="17" then
yname="天使靴"
xyyz="750"
tname="k3"

elseif wpid="18" then
yname="黄金靴"
xyyz="1200"
tname="k4"

elseif wpid="19" then
yname="毁灭靴"
xyyz="1800"
tname="k5"

elseif wpid="20" then
yname="蝴蝶靴"
xyyz="2500"
tname="k6"

elseif wpid="21" then
yname="光芒头盔"
xyyz="200"
tname="t1"

elseif wpid="22" then
yname="战神头盔"
xyyz="400"
tname="t2"

elseif wpid="23" then
yname="天使头盔"
xyyz="750"
tname="t3"

elseif wpid="24" then
yname="黄金头盔"
xyyz="1200"
tname="t4"

elseif wpid="25" then
yname="毁灭头盔"
xyyz="1800"
tname="t5"

elseif wpid="26" then
yname="蝴蝶头盔"
xyyz="2500"
tname="t6"

elseif wpid="27" then
yname="龙王头盔"
xyyz="10000"
tname="t7"

else
xyyz="10000"
yname="龙王靴"
tname="k7"
end if

Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if clng(xyyz)>rs("yz") then
msg="您的银两不够购买"&yname&"！快去赚一点吧！"
else
sql="update wupin set "&tname&"="&tname&"+1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-"&xyyz&" where cstr(ids)="&ids
  conn.Execute(sql)
msg="您花"&xyyz&"两银两购买了一"&yname&".<br/><a href='tie.asp?SessionID="&SessionID&"'>继续交易</a>"
end if
Response.Write ""&msg&"<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>