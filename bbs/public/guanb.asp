<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="个人资料开关"><p>
在这里你可以关闭你自己的资料不让被人查看!
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
id=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & id & "'"
  objgbrs.open ssql,conn
   
if objgbrs("guanb")=0  then 
Response.write "<br/>当前状态:开放"
Response.write "<br/>设置：<anchor>关闭<go method='post' href='show.asp?SessionID=" & SessionID & "'><postfield name='guanb' value='1'/></go></anchor>"
end if
if objgbrs("guanb")=1  then 
Response.write "<br/>当前状态:关闭"
Response.write "<br/>设置：<anchor>打开<go method='post' href='show.asp??SessionID=" & SessionID & "'><postfield name='guanb' value='0'/></go></anchor>"
end if
Response.write "<br/>----------"
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>




