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
<card id="card1" title="应用物品">  
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=session("useid")
wpid=request("wpid")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
set rszx=Server.CreateObject("ADODB.Recordset")
rsplzx="select * from gift Where CStr(id)='"&wpid&"'"
rszx.open rsplzx,conn
if rszx.eof then
response.write "这是什么东西啊?我怎么没见过？<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
yname=rszx("yname")
xyyz=rszx("xyyz")
rszx.close
set rszx=nothing

set rs=Server.CreateObject("ADODB.Recordset")
sql="select wp"&wpid&" from wupin where cstr(ids)='"&iduse& "'"
rs.open sql,Conn,1,1
if rs("wp"&wpid&"")<1 then
response.write "系统提示！你还没有"&yname&"啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
rs.close
set rs=nothing

if wpid>53 and wpid<=73 then
if wpid="54" then
cz="1"
elseif wpid="55" then
cz="2"
elseif wpid="56" then
cz="3"
elseif wpid="57" then
cz="4"
elseif wpid="58" then
cz="5"
elseif wpid="59" then
cz="6"
elseif wpid="60" then
cz="7"
elseif wpid="61" then
cz="8"
elseif wpid="62" then
cz="9"
elseif wpid="63" then
cz="10"
elseif wpid="64" then
fc="1"
elseif wpid="65" then
fc="2"
elseif wpid="66" then
fc="3"
elseif wpid="67" then
fc="4"
elseif wpid="68" then
fc="5"
elseif wpid="69" then
fc="6"
elseif wpid="70" then
fc="7"
elseif wpid="71" then
fc="8"
elseif wpid="72" then
fc="9"
end if

set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select * from usereg where cstr(id)='"&iduse& "'"
rs8.open strsQL,Conn,1,1
czz=clng(rs8("cz"))
fcc=clng(rs8("fanj"))
 rs8.Close
	Set rs8=Nothing

if wpid<64 then
if czz="1" then
ynames="帕萨特"
elseif czz="2" then
ynames="新皇冠"
elseif czz="3" then
ynames="法拉利"
elseif czz="4" then
ynames="保时捷"
elseif czz="5" then
ynames="劳斯来斯"
elseif czz="6" then
ynames="电动车"
elseif czz="7" then
ynames="脚踏车"
elseif czz="8" then
ynames="摩托车"
elseif czz="9" then
ynames="轮船"
elseif czz="10" then
ynames="飞机"
end if
if czz>0 then
msg="系统提示！使用物品<b>"&yname&"</b>不成功！<br/>原因：您正在使用<b>"&ynames&"</b>，请先将<b>"&ynames&"</b><a href='/BBS/Gift/zb.asp?ID="&czz&"&amp;ky=ccz&amp;SessionID="&SessionID&"'>卸下</a>,再使用!"
else
sql="update usereg set cz="&cz&" where cstr(id)="&iduse
  conn.Execute(sql)
sql="update wupin set wp"&wpid&"=wp"&wpid&"-1 where cstr(ids)="&iduse
  conn.Execute(sql)
msg="您成功使用了<b>"&yname&"</b>"
end if

  else
if fcc="1" then
ynames="赏月台"
elseif fcc="2" then
ynames="观月台"
elseif fcc="3" then
ynames="许愿台"
elseif fcc="4" then
ynames="摘月台"
elseif fcc="5" then
ynames="单身公寓"
elseif fcc="6" then
ynames="帝豪庭苑"
elseif fcc="7" then
ynames="彩色家园"
elseif fcc="8" then
ynames="环山套房"
elseif fcc="9" then
ynames="海湾别墅"
end if
if fcc>0 then
msg="系统提示！使用物品<b>"&yname&"</b>不成功！<br/>原因：您正在使用<b>"&ynames&"</b>，请先将<b>"&ynames&"</b><a href='/BBS/Gift/zb.asp?IDS="&fcc&"&amp;ky=fcs&amp;SessionID="&SessionID&"'>卸下</a>,再使用!"
else
sql="update usereg set fanj="&fc&" where cstr(id)="&iduse
  conn.Execute(sql)
sql="update wupin set wp"&wpid&"=wp"&wpid&"-1 where cstr(ids)="&iduse
  conn.Execute(sql)
msg="您成功使用了"&yname&""
end if
end if

else
msg="<b>"&yname&"</b>该物品暂时不开放使用 目前开放使用的有：汽车，房产。"
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