<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="对方的属性">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=request("id")
%>
<%
if ids=1 then
Response.write "该号游戏测试专用<br/>不能查看其装备"
Response.write "<br/><input name='ltlyuan' maxlength='200'/>"
Response.write "<br/><anchor>发送信息"
Response.write "<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'>"
Response.write "<postfield name='ltlyuan' value='$(ltlyuan)'/>"
Response.write "<postfield name='ids' value='" & ids & "'/>"
Response.write "</go></anchor><br/>-------------<br/>"
Response.Write "<anchor><prev/>[快速返回]</anchor></p></card></wml>"
response.end
end if
%>
<!--#include file="conn.asp"-->
<%
Response.write "<input name='ltlyuan' maxlength='200'/>"
Response.write "<br/><anchor>发送社区消息"
Response.write "<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'>"
Response.write "<postfield name='ltlyuan' value='$(ltlyuan)'/>"
Response.write "<postfield name='ids' value='" & ids & "'/>"
Response.write "</go></anchor><br/>-------------<br/>"
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from zb where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("wq")="1" then
wname="<img src='w/wu.gif' alt='木剑'/>"
elseif rs("wq")="2" then
wname="<img src='w/1.gif' alt='光芒剑'/>"
elseif rs("wq")="3" then
wname="<img src='w/2.gif' alt='战神剑'/>"
elseif rs("wq")="4" then
wname="<img src='w/3.gif' alt='天使剑'/>"
elseif rs("wq")="5" then
wname="<img src='w/4.gif' alt='黄金剑'/>"
elseif rs("wq")="6" then
wname="<img src='w/5.gif' alt='毁灭剑'/>"
elseif rs("wq")="7" then
wname="<img src='w/6.gif' alt='蝴蝶剑'/>"
elseif rs("wq")="8" then
wname="<img src='w/7.gif' alt='龙王剑'/>"
elseif rs("wq")="9" then
wname="<img src='w/8.gif' alt='轩辕煞魂斩'/>"
else
wname="武器未装备"
end if
if rs("dp")="1" then
dname="<img src='y/yi.gif' alt='布衣'/>"
elseif rs("dp")="2" then
dname="<img src='y/1.gif' alt='光芒甲'/>"
elseif rs("dp")="3" then
dname="<img src='y/2.gif' alt='战神甲'/>"
elseif rs("dp")="4" then
dname="<img src='y/3.gif' alt='天使甲'/>"
elseif rs("dp")="5" then
dname="<img src='y/4.gif' alt='黄金甲'/>"
elseif rs("dp")="6" then
dname="<img src='y/5.gif' alt='毁灭甲'/>"
elseif rs("dp")="7" then
dname="<img src='y/6.gif' alt='蝴蝶甲'/>"
elseif rs("dp")="8" then
dname="<img src='y/7.gif' alt='龙王甲'/>"
elseif rs("dp")="9" then
dname="<img src='y/8.gif' alt='轩辕圣甲'/>"
else
dname="衣服未装备"
end if

if rs("kyaa")="1" then
kname="<img src='x/xue.gif' alt='布料靴'/>"
elseif rs("kyaa")="2" then
kname="<img src='x/1.gif' alt='光芒靴'/>"
elseif rs("kyaa")="3" then
kname="<img src='x/2.gif' alt='战神靴'/>"
elseif rs("kyaa")="4" then
kname="<img src='x/3.gif' alt='天使靴'/>"
elseif rs("kyaa")="5" then
kname="<img src='x/4.gif' alt='黄金靴'/>"
elseif rs("kyaa")="6" then
kname="<img src='x/5.gif' alt='毁灭靴'/>"
elseif rs("kyaa")="7" then
kname="<img src='x/6.gif' alt='蝴蝶靴'/>"
elseif rs("kyaa")="8" then
kname="<img src='x/7.gif' alt='龙王靴'/>"
elseif rs("kyaa")="9" then
kname="<img src='x/8.gif' alt='轩辕圣靴'/>"
else
kname="靴子未装备"
end if


if rs("tou")="1" then
tname="<img src='t/tou.gif' alt='布料头盔'/>"
elseif rs("tou")="2" then
tname="<img src='t/1.gif' alt='光芒头盔'/>"
elseif rs("tou")="3" then
tname="<img src='t/2.gif' alt='战神头盔'/>"
elseif rs("tou")="4" then
tname="<img src='t/3.gif' alt='天使头盔'/>"
elseif rs("tou")="5" then
tname="<img src='t/4.gif' alt='黄金头盔'/>"
elseif rs("tou")="6" then
tname="<img src='t/5.gif' alt='毁灭头盔'/>"
elseif rs("tou")="7" then
tname="<img src='t/6.gif' alt='蝴蝶头盔'/>"
elseif rs("tou")="8" then
tname="<img src='t/7.gif' alt='龙王头盔'/>"
elseif rs("tou")="9" then
tname="<img src='t/8.gif' alt='轩辕圣盔'/>"
else
tname="头盔未装备"
end if
Response.Write "<b><u>ID:" & ids & "</u></b>的属性<br/>"
Response.Write "" & wname & "<br/>" & tname & "<br/>" & dname & "<br/>" & kname & "<br/>"


set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from sx where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "攻击：[" & rs("gj") &"]<br/>防守：[" & rs("fs") &"]<br/>经验：[" & rs("jy") &"]<br/>血量：[" & rs("tl") &"]<br/>等级：[" & rs("dj") &"]<br/>-------------<br/><anchor><prev/>快速返回</anchor><br/>-------------<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href='/bbs/friandbook/addcl.asp?frid=<%=ids%>&amp;SessionID=<%=SessionID%>'>加为好友</a>|<a href='/bbs/reg/useinfo.asp?id=<%=ids%>&amp;SessionID=<%=SessionID%>'>社区资料</a>
<br/>-------------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>