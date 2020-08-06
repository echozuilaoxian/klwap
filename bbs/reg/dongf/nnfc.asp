<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区医院">
<p align="left">社区医院<br/>------------
<%
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select fying,usesex,myfq from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn

if objgbrs("fying")=0 then
 response.write "<br/>你尚未结婚,何来宝宝呢?" 
   else
dim sex
if objgbrs("usesex")="1" then
sex="你进错门了,这里是男士通道."
Response.write "<br/>" & sex 
   else
if objgbrs("myfq")<15 then
 response.write "<br/>你们的宝宝还没到出生的时候,努力吧" 
   else
if objgbrs("myfq")=15 then
 response.write "<br/>你老婆的宝宝要出生了,请到<a href='/BBS/reg/dongf/bbcs1.asp?SessionID=" & SessionID & "'>生产间</a>登记你的资料" 
   end if
   end if
   end if
   end if
Response.write "<br/>-------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing


%>


