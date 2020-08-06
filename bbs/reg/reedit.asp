<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="修改资料">  
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="327"
lasttls
id=request("id")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
if objgbrs("id")=Session("useid") then
%>
<%
Response.write "<a href='/bbs/reg/reedit9.asp?SessionID=" & SessionID & "'>修改我的昵称</a><br/>"
Response.write "<a href='/bbs/reg/xgwt.asp?SessionID=" & SessionID & "'>修改安全问题</a><br/>"
Response.write "修改个人资料"
Response.write "<br/>=社区ID&#65306;" & CStr(objgbrs("id"))&"<br/>=昵称:" & converttowidebaiti(objgbrs("usename"))&""
%>
<br/>=您的性别:<select name="usesex" value="0"><option value="0">&#30007;</option><option value="1">&#22899;</option></select>
<br/>=您的Q Q:
<input  name="qq" format="*N" value="<% =objgbrs("qq") %>" maxlength="20" size="10"/>
<br/>=修改密码:(6至20位)<input type="text" name="pass" value="<% =converttowidebaiti(objgbrs("useklmm")) %>" maxlength="20" size="20"/>
<br/>=您的年龄(1至03位):<input  name="useage" format="*N" value="<% =objgbrs("useage") %>" maxlength="3" size="20"/>
<br/>=您的城市(2至10位):<input type="text" name="city" value="<% =converttowidebaiti(objgbrs("city")) %>" maxlength="10" size="20"/>
<br/>=您的签名(100字内):<input type="text" name="usejj" value="<% =converttowidebaiti(objgbrs("usejj")) %>" maxlength="100" size="20"/>
<br/><anchor>[确认修改]
<go method="post" href='/bbs/reg/reeditcl.asp?SessionID=<%=SessionID%>'>
<postfield name="pass" value="$(pass)"/>
<postfield name="qq" value="$(qq)"/>
<postfield name="usesex" value="$(usesex)"/>
<postfield name="useage" value="$(useage)"/>
<postfield name="usejj" value="$(usejj)"/>
<postfield name="city" value="$(city)"/>
</go>
</anchor>
<%else%>
<br/><img src="/guest/line.gif" alt="----------" />
<%end if%>
<br/><img src="/guest/line.gif" alt="----------" />
<br/><anchor>重置识别密码<go method="post" href="/bbs/reg/ltdlcl11.asp">
<postfield name="sjhm" value="<% =objgbrs("useklsj") %>"/>
<postfield name="pass" value="<% =objgbrs("useklmm") %>"/>
</go>
</anchor>
<br/><img src="/guest/line.gif" alt="----------" />
<%
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>[我的资料]</a>"
Response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & SessionID & "'>[我的地盘]</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a><br/></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>



