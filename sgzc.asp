<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<!--#include file="conn.inc"-->
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="注册会员">
<p>
<%
Set Rs = Server.CreateObject("Adodb.Recordset")
	Sql = "SELECT * FROM admin where id=1"
	Rs.Open Sql,conn,1,1
dim zcsz
zcsz=rs("zcsz")
rs.close
set rs=nothing%>
<%if zcsz="2" then%>
<%
dim browsers
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then 
response.write "<img src='/bbs/sorry.gif' alt='.'/><br/>"
else
randomize 
c="a,A,1,b,B,2,c,C,3,d,D,4,e,E,5,f,F,6,g,G,7,h,H,8,i,I,9,j,J,0,k,K,1,l,L,2,m,M,3,n,N,4,o,O,5,p,P,6,q,Q,7,r,R,8,s,S,9,t,T,0,u,v,w,x,y,z," 
id=split(c,",") 
for i=1 to 32
code=id(int(rnd()*36))&code 
next
%>
<a href="index.asp?hk=<%=code%>"><img src='http://211.139.9.178/PullServlet?SPID=924607&amp;ServiceID=00060709&amp;SPURL=http://<%=Request.ServerVariables("SERVER_NAME")%>/bbs/zddll.asp?sid=<%=code%>' alt='.' />自动登录注册,请稍后..</a>
<br/><b>图片显示表示已经成功,您的ID密码为您的手机号后6位,如出现无法登录注册,请尝试多次或者告知管理员.</b><br/>
<%end if%>
<%end if%>
<%if zcsz="0" or zcsz="2" then%>
<b>手机号码</b><br/><input name="sjhm" title="手机号：" type="text" format="*M" emptyok="true" maxlength="11" value=""/><br/>
<b>密码</b><input name="dlmm" title="登陆密码" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<b>昵称</b><input name="ltnc" title="论坛昵称" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<b>性别</b><select name='xb' value='2'>
<option value="1">男性</option>
<option value="2">女性</option>
<option value="3">保密</option>
</select><br/>
<b>密码保护</b>(方便取回密码，必填)<br/>
密码问题<input name="mmwt" title="密码问题" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
密码答案<input name="wtda" title="密码答案" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<anchor>确定提交
    <go href="sgzcsave.asp" method="post" accept-charset="utf-8">
        <postfield name="sjhm" value="$(sjhm)"/>
        <postfield name="dlmm" value="$(dlmm)"/>
        <postfield name="ltnc" value="$(ltnc)"/>
        <postfield name="xb" value="$(xb)"/>
        <postfield name="mmwt" value="$(mmwt)"/>
        <postfield name="wtda" value="$(wtda)"/>
    </go>
</anchor>
<%end if%>
<%if zcsz="1" then
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then 
response.write "<img src='/bbs/sorry.gif' alt='.'/><br/>"
else
randomize 
c="a,A,1,b,B,2,c,C,3,d,D,4,e,E,5,f,F,6,g,G,7,h,H,8,i,I,9,j,J,0,k,K,1,l,L,2,m,M,3,n,N,4,o,O,5,p,P,6,q,Q,7,r,R,8,s,S,9,t,T,0,u,v,w,x,y,z," 
id=split(c,",") 
for i=1 to 32
code=id(int(rnd()*36))&code 
next
%>
<a href="index.asp?hk=<%=code%>"><img src='http://211.139.9.178/PullServlet?SPID=924607&amp;ServiceID=00060709&amp;SPURL=http://<%=Request.ServerVariables("SERVER_NAME")%>/bbs/zddll.asp?sid=<%=code%>' alt='.' />自动登录注册,请稍后..</a>
<br/><b>图片显示表示已经成功,您的ID密码为您的手机号后6位,如出现无法登录注册,请尝试多次或者告知管理员.</b>
<%end if%>
<%end if%>
<br/>----------<br/>
<a href="login.asp">返回登陆</a><br/><a href="/">返回首页</a>
</p></card></wml>