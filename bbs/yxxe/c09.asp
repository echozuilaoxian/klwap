<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="开奖时间">
<p align="left"><img src='logo.gif' alt='yxxe.net'/>
<% 
Response.write "<br/>百万富翁不是梦<br/>---------<br/>"
Server.ScriptTimeout=999
dim time
time="23:00:00"
kjtimes=time+300*0.0004
kjtime="20:00:00"
if kjtime>1 then
Response.write "本期开始时间:<br/> "&time&"<br/>开奖时间: <br/>"&kjtimes&"<br/>开奖倒计时:"&kjtime&"秒<br/>现在时间:<br/>"&now&"<br/>嗯!本期还没结束,抓紧时间吧!<br/><a href='/bbs/sqcp/txhm.asp?wap=" & wap & "'>[购买彩票]</a>"
Else 
Response.write "本期已经结束,尚未开奖!<br/>"
end if
Response.write "<br/>---------<br/><a href='/bbs/sqcp/sqcp.asp?wap=" & wap & "'>[社区彩票]</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>[社区首页]</a></p></card></wml>"
%>
