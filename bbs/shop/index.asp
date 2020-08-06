<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="礼品店">
<p align='left'>
<img src='shop.gif' alt='logo'/><br/>
<a href='#card2'>与店小二对话</a><br/>
¤货架上的卡片<br/>
<a href='shop_zj.asp?wap=<%=wap%>'>+|亲吻拥抱</a><br/>
<a href='shop_gx.asp?wap=<%=wap%>'>+|搞笑整人</a><br/>
<a href='shop_mg.asp?wap=<%=wap%>'>+|玫瑰花屋</a><br/>
<a href='shop_zq.asp?wap=<%=wap%>'>+|中秋祝福</a><br/>
<a href='shop_sr.asp?wap=<%=wap%>'>+|生日祝福</a><br/>
¤货架上的CD<br/>
<a href='shop_cd.asp?wap=<%=wap%>'>>真情祝福</a><br/>
<a href='shop_cd2.asp?wap=<%=wap%>'>>爱的表白</a><br/>
-----------<br/>

<!--#INCLUDE VIRTUAL="/bbs/aa1.asp"-->
</p>
</card>
<card id="card2" title="与店小二对话">
<p>
店小二说:嘻嘻，多亏站长的提拔我当上贺卡商店的老板喽！<br/>小店这里既有大量的卡片也有大量的CD，送给你的朋友做礼物是最合适的啦，当然也可以自用，请你看看需要什么吧。<br/>
<a href='/bbs/shop/index.asp?wap=<%=wap%>'>返回上级</a>
</p>
</card>
<%
conn.close
set conn=nothing
%>
</wml>


