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
<card id="main" title="挑战失败TOP10"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999 
  dim bz,objgbrs
  bz=request("bz")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 10 * from usereg order by (-tz2) desc"
  objgbrs.open ssql,conn
if objgbrs.eof then
   Response.write "&#26242;&#26102;&#31354;&#32570;<br/>"
 Else
For k=1 to 10
bihaocont=bihaocont+1
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & bihaocont & "." & converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "</a>/" & objgbrs("tz2") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "<a href='ph3.asp?SessionID=" & SessionID & "'>[回上一级]</a><br/>"
Response.write "<a href='index.asp?SessionID=" & SessionID & "'>[竞技中心]</a><br/>"
Response.write "---------<br/>"
%>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">&#x793E;&#x533A;&#x9996;&#x9875;</a>
<%
Response.write "</p></card></wml>"
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
%>



