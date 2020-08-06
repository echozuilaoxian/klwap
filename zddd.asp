<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="自动登录注册">
<%
randomize 
c="a,A,1,b,B,2,c,C,3,d,D,4,e,E,5,f,F,6,g,G,7,h,H,8,i,I,9,j,J,0,k,K,1,l,L,2,m,M,3,n,N,4,o,O,5,p,P,6,q,Q,7,r,R,8,s,S,9,t,T,0,u,v,w,x,y,z," 
id=split(c,",") 
for i=1 to 32
code=id(int(rnd()*36))&code 
next
%>
<p><a href="index.asp?hk=<%=code%>"><img src='http://211.139.9.178/PullServlet?SPID=924607&amp;ServiceID=00060709&amp;SPURL=http://54sg.cn/bbs/zddll.asp?sid=<%=code%>' alt='.' />加载完后自动登录注册</a><br/>
<a href='sgzc.asp'>手工注册</a><br/>
<a href='index.asp'>社区首页</a><br/>
提示:如果您是第一次注册,你的密码为您的手机号后六位
</p></card></wml>







