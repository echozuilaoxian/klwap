<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<head>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
</head><card id='main' title='免费发信息'>
<p>
<img src='/bbs/sms.gif' alt=''/><br/>
每月可免费发30条.超出部分按0.1元/条!!
<br/>－－－－－<br/>
手机号码:<input name="srecs" format="*N" maxlength="11" emptyok="srecs"/><br/>
短信内容:<input type="text"  name="scontent" value="" /><br/>
〓[<anchor>确定发送<go href="http://218.204.255.90:8088/wapsys/smsbox/sendsmssbt.jsp" method="post"> 
<postfield name="srecs" value="$(srecs)"/> 
<postfield name="appid" value="112170"/> 
<postfield name="srcid" value="0"/>
<postfield name="scontent" value="$(scontent)"/> 
<postfield name="backurl" value="http://lwapy.cn"/> 
<postfield name="url" value="http://wap.monternet.com/"/>
<postfield name="isnowsend" value="true"/>
</go></anchor>]〓<br/>
免费发送成功后返回本页面可继续发送
<br/>----------<br/>注：本系统限广东移动用户使用，每月前三十条免费，超出部分0.1元每条，uc进入发送时可能会提示ip错误，但仍能成功发送！<br/><b>注意：如果你是第一次使用本系统，请先<a href="http://218.204.255.90:8088/wapsys/smsbox/regsbt.jsp?serviceitem=8001">点此链接</a>激活</b>没开通的可以现在开通，大家一起来免费发送短信吧！
<br/><anchor>返回上级<prev/></anchor><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>
