<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="剪刀石头布">
<img src='/bbs/tz/jdb.gif' alt=''/>
<p>
请输入下注额<br/>最大不能超过999金币：
<br/><input name="num" value="10" size='3' format="*N" maxlength="3"/>
<br/>请输入对方的ID：<br/>

<input name="reid" value='1' size='5' format="*N" maxlength="20"/>
<br/>
你的选择:<br/>
<anchor>剪刀
    <go href="cbid.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
        <postfield name="reid" value="$(reid)"/>
    </go>
</anchor>

<anchor>石头
    <go href="ccid.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
        <postfield name="reid" value="$(reid)"/>
    </go>
</anchor>

<anchor>布
    <go href="cdid.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8"> 
        <postfield name="num" value="$(num)"/>
        <postfield name="reid" value="$(reid)"/>
    </go>
</anchor><br/>-----------<br/>
<a href='0.asp?SessionID=<%=SessionID%>'>[回上一级]</a><br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a>
<br/>
游戏规则:<br/>
剪刀大于布,布大于石头,石头大于剪刀;<br/>
</p>
</card>
</wml>