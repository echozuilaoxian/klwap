﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
%>
<card id="main" title="升学成功">
<p align="left">
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,id,usejf,nianji from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("nianji")<>10 then
  Response.write "我晕,你不是高一的~~<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回学校</a><br/>"
    Response.end
  end if  
  '1
if objgbrs("xf")<7250 or objgbrs("qs")<14500 or objgbrs("love")<14500 then
Response.write "你的属性还不够升学!回去学够才来吧~"
end if
if objgbrs("nianji")=10 and objgbrs("xf")>=7250 and objgbrs("qs")>=14500 and objgbrs("love")>=14500 then
sql="update usereg set nianji=11 where CStr(id)='" & iduse & "'"
conn.execute sql
Response.write "恭喜!已经升为高二的学生了,努力!!"
end if
sql="Delete DATEDIFF FROM gxx WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>
