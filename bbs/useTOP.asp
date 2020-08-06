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
<card id='main' title='<%=converttowidebaiti(SystemSiteName)%>-<%=converttowidebaiti("会员排行榜")%>'>
<p align='<%=Systemdj%>'>
<% if Systemlogo<>"" then 
    response.write "<img src='"&Systemlogo&"' alt='"&converttowidebaiti(SystemUrl)&"'/><br/>"
end if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
%>
<% 
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/>------------<br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?sort=" & sort & ""
End if
   Response.write ""&converttowidebaiti(SystemSiteName)&""&converttowidebaiti("会员排行榜")&"<br/>---------------<br/>"
if SessionID="" then SessionID=Session("SessionID")
Response.write "<a href='/BBS/useTOP20.asp?sort=4&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("发帖排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=5&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("登陆排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=7&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("头衔排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=8&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("金币排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=19&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("元宝排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=3&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("社币排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=6&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("聊室积分")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=10&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("体力排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=9&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("魅力排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=1&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("智力排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=11&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("级别排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=12&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("情商排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=13&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("爱心排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=14&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("才华排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=15&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("学分排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=16&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("学历排行")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=17&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("宠物生命")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=18&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("宠物热情")&"</a><br/>"
Response.write "<a href='/BBS/useTOP20.asp?sort=2&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("最新会员")&"</a><br/>"
response.write("------------<br/>")
Response.write "<a href='/bbs/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区首页")&"</a><br/>"
%>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small><br/>
</p></card></wml>
<%conn.close
set conn=nothing%>