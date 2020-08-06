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
<card id="card1" title="头衔说明"><p>
[销魂社区]头衔说明<br/>
会员在线1小时,在线时长增加1小时,每24小时为一天.<br/>
升级要求：升级按注册天数.升级公式是：
<br/> 　
→代表大于<br/>
←代表小于<br/>
<br/>
注册天数<b>→0←10</b>下士
<br/>
注册天数<b>→9←50</b>中士
<br/>
注册天数<b>→49←100</b>上士
<br/>
注册天数<b>→99←150</b>少校
<br/>
注册天数<b>→149←200</b>中校
<br/>
注册天数<b>→199←250</b>上校
<br/> 
注册天数<b>→249←300</b>少尉
<br/>
注册天数<b>→299←400</b>中尉
<br/>
注册天数<b>→399←600</b>大尉
<br/>
注册天数<b>→599←800</b>少将
<br/>
注册天数<b>→799←1000</b>中将
<br/>
注册天数<b>→999←1200</b>大将
<br/>
注册天数<b>→1199←3000</b>元帅
<br/>-------------
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>