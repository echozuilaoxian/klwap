<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>

<card id="card1" title="宠物升级说明">  
<p><img src='cwlogo.gif' alt='LOGO'/><br/>宠物升级说明<br/>-------------<br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<%
    Response.write "1级.不明生物<br/><img src='/bbs/reg/mao/0.gif' alt='.'/>"
Response.write "<br/>生命+热情0-49"
 Response.write "<br/>2级.小小猫<br/><img src='/bbs/reg/mao/1.gif' alt='.'/>"
Response.write "<br/>生命+热情50-299"
 Response.write "<br/>3级.猫咪咪<br/><img src='/bbs/reg/mao/2.gif' alt='.'/>"
Response.write "<br/>生命+热情300-799"
response.write "<br/><a href='/bbs/reg/cwsm1.asp?SessionID=" & SessionID & "'>[下一页]</a>"
Response.write "<br/>-------------<br/>"
response.write "<a href='/bbs/chan/indexcw.asp?SessionID=" & SessionID & "'>宠物餐厅</a>"
response.write "<br/><a href='/bbs/chan/cwxy.asp?SessionID=" & SessionID & "'>宠物浴室</a><br/>"
response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"%>



