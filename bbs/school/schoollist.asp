<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="我的学业">
<p align="left">
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="156"
lasttlls="156"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowide(gfdsa) & "</a>的学业情况"
Response.write "<br/><a href='/bbs/mysx.asp?SessionID="&SessionID&"'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,id,usejf,nianji from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("xf")<0 then
  response.Write "<br/>你已经退学了!"
  response.Write "<br/>当前学分:0"
  end if 

if objgbrs("xf")>=0 then
if objgbrs("nianji")=1 then
response.Write "<br/>现读小学一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:500<br/>情商:1000<br/>爱心:1000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(500-objgbrs("xf"))&"<br/>情商:"&(1000-objgbrs("qs"))&"<br/>爱心:"&(1000-objgbrs("love"))&""
end if
if objgbrs("nianji")=2 then
response.Write "<br/>现读小学二年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:1000<br/>情商:2000<br/>爱心:2000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(1000-objgbrs("xf"))&"<br/>情商:"&(2000-objgbrs("qs"))&"<br/>爱心:"&(2000-objgbrs("love"))&""
end if
if objgbrs("nianji")=3 then
response.Write "<br/>现读小学三年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:1500<br/>情商:3000<br/>爱心:3000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(1500-objgbrs("xf"))&"<br/>情商:"&(3000-objgbrs("qs"))&"<br/>爱心:"&(3000-objgbrs("love"))&""
end if
if objgbrs("nianji")=4 then
response.Write "<br/>现读小学四年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:2000<br/>情商:4000<br/>爱心:4000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(2000-objgbrs("xf"))&"<br/>情商:"&(4000-objgbrs("qs"))&"<br/>爱心:"&(4000-objgbrs("love"))&""
end if
if objgbrs("nianji")=5 then
response.Write "<br/>现读小学一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:2500<br/>情商:5000<br/>爱心:5000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(2500-objgbrs("xf"))&"<br/>情商:"&(5000-objgbrs("qs"))&"<br/>爱心:"&(5000-objgbrs("love"))&""
end if
if objgbrs("nianji")=6 then
response.Write "<br/>现读小学一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:3000<br/>情商:6000<br/>爱心:6000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(3000-objgbrs("xf"))&"<br/>情商:"&(6000-objgbrs("qs"))&"<br/>爱心:"&(6000-objgbrs("love"))&""
end if
if objgbrs("nianji")=7 then
response.Write "<br/>现读初中一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:4500<br/>情商:9000<br/>爱心:9000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(4500-objgbrs("xf"))&"<br/>情商:"&(9000-objgbrs("qs"))&"<br/>爱心:"&(9000-objgbrs("love"))&""
end if
if objgbrs("nianji")=8 then
response.Write "<br/>现读初中二年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:5250<br/>情商:10500<br/>爱心:10500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(5250-objgbrs("xf"))&"<br/>情商:"&(10500-objgbrs("qs"))&"<br/>爱心:"&(10500-objgbrs("love"))&""
end if
if objgbrs("nianji")=9 then
response.Write "<br/>现读初中三年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:6250<br/>情商:12500<br/>爱心:12500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(6250-objgbrs("xf"))&"<br/>情商:"&(12500-objgbrs("qs"))&"<br/>爱心:"&(12500-objgbrs("love"))&""
end if
if objgbrs("nianji")=10 then
response.Write "<br/>现读高中一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:7250<br/>情商:14500<br/>爱心:14500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(7250-objgbrs("xf"))&"<br/>情商:"&(14500-objgbrs("qs"))&"<br/>爱心:"&(14500-objgbrs("love"))&""
end if
if objgbrs("nianji")=11 then
response.Write "<br/>现读高中二年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:8250<br/>情商:16500<br/>爱心:16500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(8250-objgbrs("xf"))&"<br/>情商:"&(16500-objgbrs("qs"))&"<br/>爱心:"&(16500-objgbrs("love"))&""
end if
if objgbrs("nianji")=12 then
response.Write "<br/>现读高中三年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:9750<br/>情商:19500<br/>爱心:19500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(9750-objgbrs("xf"))&"<br/>情商:"&(19500-objgbrs("qs"))&"<br/>爱心:"&(19500-objgbrs("love"))&""
end if
if objgbrs("nianji")=13 then
response.Write "<br/>现读大学一年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:11250<br/>情商:22500<br/>爱心:22500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(11250-objgbrs("xf"))&"<br/>情商:"&(22500-objgbrs("qs"))&"<br/>爱心:"&(22500-objgbrs("love"))&""
end if
if objgbrs("nianji")=14 then
response.Write "<br/>现读大学二年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:12750<br/>情商:25500<br/>爱心:25500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(12750-objgbrs("xf"))&"<br/>情商:"&(25500-objgbrs("qs"))&"<br/>爱心:"&(25500-objgbrs("love"))&""
end if
if objgbrs("nianji")=15 then
response.Write "<br/>现读大学三年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:14250<br/>情商:28500<br/>爱心:28500"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(14250-objgbrs("xf"))&"<br/>情商:"&(28500-objgbrs("qs"))&"<br/>爱心:"&(28500-objgbrs("love"))&""
end if
if objgbrs("nianji")=16 then
response.Write "<br/>现读大学四年级"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:20000<br/>情商:40000<br/>爱心:40000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(20000-objgbrs("xf"))&"<br/>情商:"&(40000-objgbrs("qs"))&"<br/>爱心:"&(40000-objgbrs("love"))&""
end if
if objgbrs("nianji")=17 then
response.Write "<br/>已经是硕士生"
response.Write "<br/>--------<br/>下级需要的属性"
response.Write "<br/>学分:30000<br/>情商:60000<br/>爱心:60000"
response.Write "<br/>--------<br/>离升级还需要属性"
response.Write "<br/>学分:"&(30000-objgbrs("xf"))&"<br/>情商:"&(60000-objgbrs("qs"))&"<br/>爱心:"&(60000-objgbrs("love"))&""
end if
if objgbrs("nianji")=18 then
response.Write "<br/>已经是博士生"
end if
end if

Response.write "<br/>------------<br/><a href='/bbs/school/ph.asp?SessionID="&SessionID&"'>返回排行榜</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&now&"</p></card></wml>"
conn.close
set conn=nothing
%>