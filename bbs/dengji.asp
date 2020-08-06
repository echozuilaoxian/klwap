<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="<%=converttowidebaiti(SystemSiteName)%>-升级说明">
<p>
级别升级说明<br/>-----------<br/>
一、会员在线1小时增加1点经验，每发表一篇文章增加5点经验. <br/>
二、经验每增加一定的点将自动升级.新注册会员级别是一颗星
<br/>升级公式如下：(注:"→"是小于,"←"是大于)
<br/>经验→500点[<img src='/bbs/logo/leve/1.gif' alt='10级'/>]10级
<br/>经验→1000点←500点[<img src='/bbs/logo/leve/2.gif' alt='20级'/>]20
<br/>....
<br/>经验→2000点←1500点[<img src='/bbs/logo/leve/4.gif' alt='40级'/>]40
<br/>经验→6000点←5000点[<img src='/bbs/logo/leve/8.gif' alt='80级'/>]80
<br/>....
<br/>经验→13000点←10000点[<img src='/bbs/logo/leve/12.gif' alt='120级'/>]120级
<br/>经验→28000点←25000点[<img src='/bbs/logo/leve/17.gif' alt='170级'/>]170级
<br/>....
<br/>经验→40000点←34000点[<img src='/bbs/logo/leve/12.gif' alt='200级'/><img src='/bbs/logo/leve/xx.gif' alt=''/>]200级
<br/>经验→58000点←52000点[<img src='/bbs/logo/leve/tylogo.gif' alt='230级'/>]230级
<br/>....
<br/>经验→76000点←70000点[<img src='/bbs/logo/leve/tylogo.gif' alt='260级'/><img src='/bbs/logo/leve/yllogo.gif' alt=''/><img src='/bbs/logo/leve/xx.gif' alt=''/>]260级
<br/>经验→100000点←94000点[<img src='/bbs/logo/leve/gl.gif' alt='300级'/>]300级
<br/>....
以下是太阳神级别,待推出...
<br/>------------<br/>    
<anchor>返回上级<prev/></anchor><br/>    
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/> 
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a><br/> 
</p>
</card>
</wml>