<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="&#21457;&#35328;">
<onevent type="onenterforward">
<refresh>
<%
if ooo=1 then
set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
talk=objgbrs("naiyo")
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
response.write "<setvar name='talk' value='" & talk & " '/>"
else
dim talk
talk=Request("talk")
response.write "<setvar name='talk' value='" & talk & " '/>"
end if
%>
</refresh>
</onevent>
<p>
<%
dim show
show=request("show")
%>
请输入您要说的话：
<br/><input type="text" name="talk" maxlength="100"/>
<br/><anchor>[提交]
<go method="post" href='talkcl.asp?SessionID=<%=SessionID%>'>
<postfield name="talk" value="$(talk)"/>
<postfield name="forname" value="大家"/>
<postfield name="show" value="<% =show %>"/>
</go>
</anchor>
<br/>--------
<br/><a href='chatroom.asp?t=<% =time() & "&amp;show=" & show %>&amp;SessionID=<%=SessionID%>'>[返回上级]</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%>
</p>
</card>
</wml>



