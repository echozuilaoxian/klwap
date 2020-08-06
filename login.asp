<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>

<!--#include file="conn.inc"-->
<!--#include file="md5.asp"-->

<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Dim urls,D_UIds,s_UId,Z_urls
urls=Request.Querystring("url")
If urls="" Then urls="index.asp"
If instr(urls,"@@")>0 or instr(urls,"?")>0 Then
D_UIds="&amp;hk="
Else
D_UIds="?hk="
End If

If instr(urls,"@@")>0 or instr(urls,"?")>0 Then
S_UIds="@@hk="
Else
S_UIds="?hk="
End if
yy=Month(now)&"" 
rr=Day(now)&"" 
if len(rr)=1 then rr="0"&rr 
hh=hour(now)&"" 
if len(hh)=1 then hh="0"&hh
mm=minute(now)&"" 
if len(mm)=1 then mm="0"&mm
ss=second(now)&"" 
if len(ss)=1 then ss="0"&ss
ttvv="" & yy & "" & rr &"" & hh &"" & mm &""& ss &""
%>
<%cz=request("cz")
cw=request("cw")%>
<%
dim hk
hk=request("hk")
%>
<%if cz="" then%>
<%if cw="1" then
   Response.write "<card title='社区登陆'><p>"
 Response.write "账号错误没有该会员注册信息！<br/>"
 Response.Write "<a href='login.asp?hk="&hk&"'>返回登陆</a><br/>"
 Response.Write "</p></card></wml>"
 response.end
 End if%>
<%if cw="2" then
   Response.write "<card title='社区登陆'><p>"
 Response.write "密码错误<br/>"
 Response.Write "<a href='login.asp?hk="&hk&"'>返回登陆</a><br/>"
 Response.Write "</p></card></wml>"
 response.end
 End if%>
<%if cw="out" then
   Response.write "<card title='社区登陆'><p>"
   Response.write "您被已加黑本社区,如有疑问请在首页留言站长<br/>"
 Response.Write "<a href='/index.asp?hk="&hk&"'>返回首页</a><br/>"
 Response.Write "</p></card></wml>"
 response.end
 End if%>
<card title="社区登陆"><p>
<select name="nai" value="1">
<option value="1">手机号</option>
<option value="2">用户ID</option>
</select><br/>
<input name="name" title="用户" type="text" format="*N" emptyok="true" maxlength="500"  value=""/><br/>
<b>密码:</b><br/>
<input name="dlmm" title="密码：" type="password" format="*M" emptyok="true" maxlength="500" value=""/><br/>

<%
Response.write "<anchor title=""登陆"">[确认登陆]"
			Response.write "<go href=""login.asp?cz=1&amp;wapgo="&urls&S_UIds&s_UId&""" method=""post"">"
			Response.write "<postfield name=""name1"" value=""$(name)"" />"
			Response.write "<postfield name=""dlmm1"" value=""$(dlmm)"" />"
			Response.write "<postfield name=""nai"" value=""$(nai)"" />"
			Response.write "</go></anchor><br/>"%>

-----------<br/>
<%if zcys < 3 then %>
<a href='sgzc.asp'>手动注册</a><br/>
 <a href='zddd.asp'>自动登录</a><br/>
 <a href='sgzc.asp'>免费注册</a><br/>
<%else%>
本站注册功能暂时关闭<br/>
原因:<%=ubb(zcyy)%><br/>
<%end if%>
<a href="index.asp">游客参观</a>
<br/><a href="bbs/mov.asp">找回密码</a>
<br/><a href="/">返回首页</a><br/>
<%elseif cz="1" then%>
<%dim wapgo
wapgo=Request.QueryString("wapgo")
wapgo=replace(wapgo,"@@","&amp;")
nai=request("nai")
name2=request("name1")
sjhm=request("name1")
dlmm2=request("dlmm1")
urls=request("urls")
if nai="" or name2="" or sjhm="" or dlmm2="" then
response.redirect "login.asp"
end if
set zhh=Server.CreateObject("ADODB.Recordset")
if nai=1 then
  zhhssql="select * from Users where sjhm='"&sjhm&"'"
else
  zhhssql="select * from Users where id="&sjhm&""
end if
  zhh.open zhhssql,conn,1,2
if zhh.eof then
response.redirect "login.asp?cw=1"
else
if dlubb(dlmm2)<>zhh("mm") then response.redirect "login.asp?cw=2"
if dlubb(dlmm2)=zhh("mm") then 
  sql="update Users set dlsj=now() Where sjhm='" & name2 & "'"
  conn.Execute(sql)
Response.write "<card title='社区登陆' ontimer="""&wapgo&""&zhh("grsb")&""">"
Response.write "<timer value='20'/><p>"
response.write " 登录成功！正在返回之前页，<br/>如果没有跳转请"
response.write "<a href='"&wapgo&""&zhh("grsb")&"'>手动进入</a><br/>"%>
----------<br/><a href="hy.asp?hk=<%=zhh("grsb")%>">地盘</a>-<a href="index.asp?hk=<%=zhh("grsb")%>">社区</a>-<a href="/index.asp?hk=<%=zhh("grsb")%>">首页</a>
<%zhh.close
set zhh=nothing
conn.close
set conn=nothing
end if
end if
end if
%>

</p>
</card>
</wml>