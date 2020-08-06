<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head><%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<card id="card1" title="等级说明"><p>
[社区论坛]会员等级说明<br/>
升级要求：升级按注册天数.升级公式是：
<br/> 　
→代表大于<br/>
←代表小于<br/>
注册天数<b>→0←7</b>无名小卒
<br/>
注册天数<b>→7←15</b>初出江湖
<br/>
注册天数<b>→15←30</b>江湖新秀
<br/>
注册天数<b>→30←60</b>崭露头角
<br/>
注册天数<b>→60←90</b>江湖小侠
<br/>
注册天数<b>→90←120</b>江湖大侠
<br/> 
注册天数<b>→120←150</b>江湖豪侠
<br/>
注册天数<b>→150←180</b>江湖至尊
<br/>
注册天数<b>→180←240</b>武林侠客
<br/>
注册天数<b>→240←300</b>武林豪侠
<br/>
注册天数<b>→300←360</b>武林名宿
<br/>
注册天数<b>→360←420</b>武林仙人
<br/>
注册天数<b>→420←510</b>武林尊者
<br/>
注册天数<b>→510←600</b>武林盟主
<br/>
注册天数<b>→600←690</b>威振八方
<br/>
注册天数<b>→690←780</b>一代宗师
<br/>
注册天数<b>→780←870</b>一代侠圣
<br/>
注册天数<b>→870←960</b>万人景仰
<br/>
注册天数<b>→960←1050</b>独孤求败
<br/> 
注册天数<b>→1050←10000</b>天界至尊
<br/>-------------
<br/><anchor>返回上级<prev/></anchor>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>