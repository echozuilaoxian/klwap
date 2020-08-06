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
<setvar name="talk" value=""/>
</refresh>
</onevent>
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
dim show
show=request("show")
%>
发言内容:
<br/><input type="text" name="talk" maxlength="100"/>
<br/><anchor>快速发言
<go method="post" href='talkcl.asp?SessionID=<%=SessionID%>'>
<postfield name="talk" value="$(talk)"/>
<postfield name="forname" value="$(forname)"/>
<postfield name="show" value="<% =show %>"/>
</go>
</anchor>
<br/>对谁说话?
<br/><select name="forname" value="&#22823;&#23478;"><option value="&#22823;&#23478;">&#22823;&#23478;</option>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where CStr(lasttl)='200' order by id"
  objgbrs.open ssql,conn,1,3
 Do while not objgbrs.eof
  response.write "<option value='" & objgbrs("name") & "'>" & objgbrs("name") & "ID:" & objgbrs("ids") & "</option>"
objgbrs.Movenext
Loop
conn.close
set objgbrs=nothing
set conn=nothing
%>
</select>
<br/><anchor>发 言
<go method="post" href='talkcl.asp?SessionID=<%=SessionID%>'>
<postfield name="talk" value="$(talk)"/>
<postfield name="forname" value="$(forname)"/>
<postfield name="show" value="<% =show %>"/>
</go>
</anchor>
<br/>----------<%
Response.write "<br/><a href='chatroom.asp?show=1&amp;SessionID=" & SessionID & "'>股票交流室</a>"%>
<br/><a href='/bbs/gp/index.asp?SessionID=<%=SessionID%>'>股市</a>-<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



