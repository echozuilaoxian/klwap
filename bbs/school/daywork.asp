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
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
yue=month(date())
nian=year(date())
 thismon=nian&"-"&yue&"-1"
 nextmon=dateadd("m",1,thismon)
 tiancount=datediff("d",thismon,nextmon)  '本月的天数
dim wek,wekday
wek= Weekday(date())
select case wek
case 1
wekday= "周日"
case 2
wekday= "周一"
case 3
wekday= "周二"
case 4
wekday= "周三"
case 5
wekday= "周四"
case 6
wekday= "周五"
case 7
wekday= "周六"
end select
%>
<card id="main" title="<%=wekday%>-课程表">
<p align="left">
<%
response.write "本月共"&tiancount&"天,今天是"&wekday&"<br/>当前时间"&time&"<br/>-------------"
'星期一
if wek=2 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-升旗</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-升旗"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-设计</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-设计"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-计算机</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-计算机"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-法律</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-法律"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-美容</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-美容"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-语文</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-语文"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-数学</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-数学"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-炼金术</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-炼金术"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if

'星期二
if wek=3 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-早读</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-早读"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-地理</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-地理"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-烹饪</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-烹饪"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-绘画</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-绘画"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-设计</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-设计"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-游戏</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-游戏"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-美容</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-美容"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-动漫</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-动漫"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if

'星期三
if wek=4 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-早读</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-早读"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-营销</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-营销"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-金融</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-金融"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-美术</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-美术"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-牧场</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-牧场"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-音乐</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-音乐"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-美术</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-美术"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-炼金术</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-炼金术"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if

'星期四
if wek=5 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-早读</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-早读"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-媒体</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-媒体"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-游戏</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-游戏"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-计算机</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-计算机"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-生理</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-生理"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-制造</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-制造"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-娱乐</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-娱乐"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-动漫</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-动漫"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if

'星期五
if wek=6 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-早读</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-早读"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-医疗</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-医疗"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-股票</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-股票"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-美容</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-美容"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-影视</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-影视"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:50-电脑</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-电脑"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-涂鸦</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:30-涂鸦"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-绘画</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-绘画"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?wap="&wap&"'>现在是休息时间!</a>"
end if
end if


'星期六
if wek=7 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-早读</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-早读"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-社交</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-社交"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-摄影</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-摄影"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-户外</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-户外"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-金融</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-金融"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-媒体</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-媒体"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-股票</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-股票"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-辩论</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-辩论"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if


'星期日
if wek=1 then
If time >= #08:00:00# and Time =< #09:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>08:00-09:00-自习</a>"
end if
If time < #08:00:00# or Time > #09:00:00# Then
response.Write "<br/>08:00-09:00-自习"
end if
'----------
If time >= #10:00:00# and Time =< #11:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>10:00-11:00-自习</a>"
end if
If time < #10:00:00# or Time > #11:00:00# Then
response.Write "<br/>10:00-11:00-自习"
end if
'----------
If time >= #12:00:00# and Time =< #13:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>12:00-13:00-自习</a>"
end if
If time < #12:00:00# or Time > #13:00:00# Then
response.Write "<br/>12:00-13:00-自习"
end if
'----------
If time >= #14:00:00# and Time =< #15:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>14:00-15:00-自习</a>"
end if
If time < #14:00:00# or Time > #15:00:00# Then
response.Write "<br/>14:00-15:00-自习"
end if
'----------
If time >= #16:00:00# and Time =< #17:00:00# Then
response.Write "<br/><a href='/bbs/school/schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>16:00-17:00-自习</a>"
end if
If time < #16:00:00# or Time > #17:00:00# Then
response.Write "<br/>16:00-17:00-自习"
end if
'----------
If time >= #18:00:00# and Time =< #19:00:00# Then
response.Write "<br/><a href='schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>18:00-19:00-自习</a>"
end if
If time < #18:00:00# or Time > #19:00:00# Then
response.Write "<br/>18:00-19:00-自习"
end if
'----------
If time >= #20:00:00# and Time =< #21:00:00# Then
response.Write "<br/><a href='schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>20:00-21:00-自习</a>"
end if
If time < #20:00:00# or Time > #21:00:00# Then
response.Write "<br/>20:00-21:00-自习"
end if
'----------
If time >= #22:00:00# and Time =< #23:00:00# Then
response.Write "<br/><a href='schoolwork.asp?rd=3&amp;SessionID="&SessionID&"'>22:00-23:00-自习</a>"
end if
If time < #22:00:00# or Time > #23:00:00# Then
response.Write "<br/>22:00-23:00-自习"
end if
'----------
If #09:00:00#< time < #10:00:00# or #11:00:00#< Time < #12:00:00# or #13:00:00#<time<#14:00:00# or #15:00:00#<time<#16:00:00# or #17:00:00#<time<#18:00:00# or #19:00:00#<time<#20:00:00# or #21:00:00#<#22:00:00# or #23:00:00#<time<#08:00:00# Then
response.Write "<br/><a href='school.asp?SessionID="&SessionID&"'>现在是休息时间!</a>"
end if
end if
response.write "<br/>-------------<br/><a href='/bbs/school/day.asp?SessionID="&SessionID&"'>查看每周课程</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"

conn.close
set conn=nothing
%>