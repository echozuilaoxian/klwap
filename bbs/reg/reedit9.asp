<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="修改个人资料"><p>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim id
id=request("id")
lasttlls="326"
lasttls
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "' and DATEDIFF('s', regtimes, now()) < 5400*60"
    objgbrs.open sql,conn
if objgbrs.eof then
    response.write "您注册天数已经大于三天，不能再修改昵称了"
   else
%>
<%
Response.write "注意：注册天数大于三天将不能再修改昵称<br/><br/>"
Response.write "修改个人资料"
Response.write "<br/>--社区ID&#65306;" & converttowidebaiti(objgbrs("id"))&""
%>
<br/>--修改昵称:(2至8位)<input type="text" name="name" value="<% =converttowidebaiti(objgbrs("usename")) %>" maxlength="8" size="20"/>
<br/>--修改密码:(6至20位)<input type="text" name="pass" value="<% =converttowidebaiti(objgbrs("useklmm")) %>" maxlength="20" size="20"/>
<br/>--您的性别:<select name="usesex" value="0"><option value="0">&#30007;</option><option value="1">&#22899;</option></select>
<br/>--您的年龄(1至03位):<input  name="useage" format="*N" value="<% =converttowidebaiti(objgbrs("useage")) %>" maxlength="3" size="20"/>
<br/>--所在城市(2至10位):<input type="text" name="city" value="<% =converttowidebaiti(objgbrs("city")) %>" maxlength="10" size="20"/>
<br/>--个人简介(100字内):<input type="text" name="usejj" value="<% =converttowidebaiti(objgbrs("usejj")) %>" maxlength="100" size="20"/>
<br/><anchor>[确认修改]
<go method="post" href='/bbs/reg/reeditcl9.asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<postfield name="pass" value="$(pass)"/>
<postfield name="usesex" value="$(usesex)"/>
<postfield name="useage" value="$(useage)"/>
<postfield name="usejj" value="$(usejj)"/>
<postfield name="city" value="$(city)"/>
<postfield name="mmbh" value="$(mmbh)"/>
</go>
</anchor>
<%
end if
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<%
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>------------<br/>=vip特权=<br/><a href='/bbs/reg/reedit9vip.asp?SessionID=" & SessionID & "'>修改昵称</a><br/>"
End if
%>
<br/>------------
<%
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>[我的地盘]</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>[网站首页]</a></p></card></wml>"
%>