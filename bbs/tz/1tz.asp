﻿<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<%
dim id
id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发起挑战">
<p>
请输入下注额:
<br/><input name="num" value="10" size='3' format="*N" maxlength="4"/>
<br/>你的选择:<br/>
<anchor>〖剪刀〗
    <go href="cbid.asp?reid=<%=id%>&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
       
    </go>
</anchor>
<anchor>〖石头〗
    <go href="ccid.asp?reid=<%=id%>&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
       
    </go>
</anchor>
<anchor>〖布〗
    <go href="cdid.asp?reid=<%=id%>&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8"> 
        <postfield name="num" value="$(num)"/>
      
    </go>
</anchor><br/>
-----------<br/>
<a href='10.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>'>[返回上级]</a><br/>
<a href='/bbs/tz/chatroom/chatroom.asp?SessionID=<%=SessionID%>'>[竞技大厅]</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a>
<br/>
游戏规则:<br/>
剪刀大于布,布大于石头,石头大于剪刀;<br/>
-----------<br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
<%
response.write "</p></card></wml>"
%>


