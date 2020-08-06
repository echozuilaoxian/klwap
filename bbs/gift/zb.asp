<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="卸下物品">  
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=session("useid")
idc=request("idc")
ids=request("ids")
ky=request("ky")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?idc="&idc&"&ids="&ids&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

set rs8=Server.CreateObject("ADODB.Recordset")
strQL="select * from usereg where cstr(id)='"&iduse& "'"
rs8.open strQL,Conn,1,1
czz=clng(rs8("cz"))
fcc=clng(rs8("fanj"))
rs8.Close
Set rs8=Nothing

if czz="1" then
wpid="wp54"
ynames="帕萨特"
elseif czz="2" then
wpid="wp55"
ynames="新皇冠"
elseif czz="3" then
wpid="wp56"
ynames="法拉利"
elseif czz="4" then
wpid="wp57"
ynames="保时捷"
elseif czz="5" then
wpid="wp58"
ynames="劳斯来斯"
elseif czz="6" then
wpid="wp59"
ynames="电动车"
elseif czz="7" then
wpid="wp60"
ynames="脚踏车"
elseif czz="8" then
wpid="wp61"
ynames="摩托车"
elseif czz="9" then
wpid="wp62"
ynames="轮船"
elseif czz="10" then
wpid="wp63"
ynames="飞机"
end if

if fcc="1" then
wpids="wp64"
yname="赏月台"
elseif fcc="2" then
wpids="wp65"
yname="观月台"
elseif fcc="3" then
wpids="wp66"
yname="许愿台"
elseif fcc="4" then
wpids="wp67"
yname="摘月台"
elseif fcc="5" then
wpids="wp68"
yname="单身公寓"
elseif fcc="6" then
wpids="wp69"
yname="帝豪庭苑"
elseif fcc="7" then
wpids="wp70"
yname="彩色家园"
elseif fcc="8" then
wpids="wp71"
yname="环山套房"
elseif fcc="9" then
wpids="wp72"
yname="海湾别墅"
end if

if ky="ccz" then

if czz<1 then 
msg="您没有正在使用的车子！"
else
sql="update usereg set cz='0' where cstr(id)="&iduse
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"+1 where cstr(ids)="&iduse
  conn.Execute(sql)

msg="你成功将<b><u>"&ynames&"</u></b>放进了 仓库!"
end if

elseif ky="fcs" then
if fcc<1 then 
msg="您没有正在使用的房子!"
else
sql="update usereg set fanj='0' where cstr(id)="&iduse
  conn.Execute(sql)
sql="update wupin set "&wpids&"="&wpids&"+1 where cstr(ids)="&iduse
  conn.Execute(sql)
msg="你成功将<b><u>"&yname&"</u></b>放进了 仓库!"
end if

else
msg="错误408! 你是否正确的卸下物品?"
end if

response.write msg
%>
<br/>-----------<br/>
<a href="/BBS/reg/useinfo.asp?ID=<%=iduse%>&amp;SessionID=<%=SessionID%>">返回我的资料</a><br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml><%
conn.close
 set conn=nothing%>