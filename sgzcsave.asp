<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="md5.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="注册会员">
<p>
<%
dim sjhm,dlmm,qrmm,csrq,ltnc,mmdd,mmnini,grjs,tjr,xb,grip,mmwt,wtda,ttxx,ids
sjhm=usb(request("sjhm"))
ltnc=usb(request("ltnc"))
dlmm=usb(request("dlmm"))
wtda=usb(request("wtda"))
ids=usb(request("ids"))
if ids<>"" then ids=clng(ids)
if ids = "" or IsNumeric(ids) = False then
ids=0
end if
'检查ID是否存在
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "SELECT id FROM users where id="&ids,conn,1,1
if rs.eof then
  ids=0
end if
  rs.close
  set rs=Nothing

set zhh=Server.CreateObject("ADODB.Recordset")
  zhhssql="select nini from [Users] where [nini]='"&ltnc&"'"
  zhh.open zhhssql,conn,1,2
if not zhh.eof then
response.redirect "sgzcsave.asp?cw=5"
end if
zhh.close
set zhh=nothing
set rsj=Server.CreateObject("ADODB.Recordset")
jsql="select sjhm from [Users] where [sjhm]='"&sjhm&"'"
rsj.open jsql,conn,1,2
if not rsj.eof then
response.redirect "sgzcsave.asp?cw=4"
end if
rsj.close
set rsj=nothing
set zhhy=Server.CreateObject("ADODB.Recordset")
  zhhssqly="select id from [Users] order by id desc"
  zhhy.open zhhssqly,conn,1,1
if not zhhy.eof then
mmdd=zhhy("id")+1
mmnini="会员("&mmdd&")"
else
mmnini="会员(1)"
end if
zhhy.close
set zhhy=nothing
grjs=usb(request("grjs"))
if grjs="" then grjs="这家伙好懒，资料没有写"
xb=usb(request("xb"))
if xb="1" then ttxx="tou/boy/1.gif"
if xb="2" then ttxx="tou/mm/1.gif"
if xb="3" then ttxx="tou/mm/1.gif"
mmwt=usb(request("mmwt"))
grip=Request.ServerVariables("REMOTE_ADDR")
cw=usb(request("cw"))
sid=Session.sessionid
mmsb=md5(md5(sjhm+sid,16),32)
%>
<%if cw="" then
if sjhm="" or dlmm="" or ltnc="" or mmwt="" or wtda="" then response.redirect "sgzcsave.asp?cw=1"
if len(sjhm)<>11 then response.redirect "sgzcsave.asp?cw=2"
if left(sjhm,2)<>13 and left(sjhm,2)<>15 then response.redirect "sgzcsave.asp?cw=2"
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [Users] order by id desc"
rs.open rspl,conn,1,2
rs.addnew
if sjhm<>"" then rs("sjhm")=sjhm
if dlmm<>"" then rs("mm")=dlmm
if ltnc<>"" then rs("nini")=ltnc
if grjs<>"" then rs("grjs")=grjs
if xb<>"" then rs("grsex")=xb
if mmsb<>"" then rs("grsb")=mmsb
if mmwt<>"" then rs("mmwt")=mmwt
if csrq<>"" then rs("csrq")=csrq
if wtda<>"" then rs("wtda")=wtda
if grip<>"" then rs("myip")=grip
if ttxx<>"" then rs("grtx")=ttxx
rs("zcsj")=now()
rs("sfyk")="0"
rs.update
rs.close
set rs=nothing
dim rsl,rspll
set rsl=Server.CreateObject("ADODB.Recordset")
rspll="select * from tbxx"
rsl.open rspll,conn,1,2
rsl.addnew
rsl("fnr")="欢迎您，您的ID是"&mmdd&"密码是"&dlmm&"请牢记您的个人资料"
rsl("sid")=mmdd
rsl("fid")="0"
rsl.update
rsl.close
set rsl=nothing
if ids<>0 then
set rsl=Server.CreateObject("ADODB.Recordset")
rspll="select * from tbxx"
rsl.open rspll,conn,1,2
rsl.addnew
rsl("fnr")="您推荐了新会员(ID:"&mmdd&")注册,为了感谢您的支持,系统奖励您"&downjf&"宣传积分！"
rsl("sid")=ids
rsl("fid")="0"
rsl.update
rsl.close
set rsl=nothing
  conn.execute("update Users Set sfyk = sfyk + "&downjf&" where ID="&ids)
  conn.execute("update Users Set tj = tj + 1 where ID="&ids)
  Response.write ""&ltname&"欢迎您！推荐人(ID:"&ids&")<br/>"
end if
%>
恭喜!注册成功，<br/>
<a href="index.asp?hk=<%=mmsb%>">进入社区</a>
<%elseif cw="1" then%>
手机号/登陆密码/论坛昵称/密码问题/密码答案等不能为空
<%elseif cw="2" then%>
为了您更好交流，请输入正确的手机号！
<%elseif cw="3" then%>
您输入的两次密码不一样！
<%elseif cw="4" then%>
该手机号已经被注册！
<%elseif cw="5" then%>
该昵称已经被使用！
<%end if%>
<%if cw<>"" then%>
<br/><a href="sgzc.asp">返回重写</a>
<%end if%>
<br/><a href="index.asp?hk=<%=hk%>">返回首页</a>
<%conn.close
set conn=nothing%>
</p></card></wml>