<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="课程安排">
<p align="left">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
response.Write "课程安排<br/>--------"
response.Write "<br/>周一:升旗、设计、计算机、法律、美容、语文、数学、炼金术、自习"
response.Write "<br/>周二:早读、地理、烹饪、绘画、设计、游戏、美容、动漫、自习"
response.Write "<br/>周三:早读、营销、金融、美术、牧场、音乐、美术、炼金术、自习"
response.Write "<br/>周四:早读、媒体、游戏、计算机、生理、制造、娱乐、动漫、自习"
response.Write "<br/>周五:早读、医疗、股票、美容、影视、电脑、涂鸦、绘画、自习"
response.Write "<br/>周六:早读、社交、摄影、户外、金融、辩论、媒体、股票、自习"
response.Write "<br/>周日:自习、自习、自习、自习、自习、自习、自习、自习、自习"
response.Write "<br/>--------"
response.Write "<br/><a href='/bbs/school/daywork.asp?SessionID="&SessionID&"'>返回当天课程</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
%>