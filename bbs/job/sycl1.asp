﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
%>
<card id="main" title="确定加入">
<p align="left">
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,id from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("gongzuo")<0 then
  Response.write "出错了,请联系管理员"
  end if
  if objgbrs("gongzuo")>1 then
  Response.write "你已经有了工作,如果有兴趣的,请辞了那工作再来吧!"
  end if
  if objgbrs("gongzuo")=0 then
  Response.write "你是否加入这个工作?<br/>"
  Response.write "<a href='/bbs/job/sycl.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>&gt;确定&lt;</a><br/>"
  Response.write "<a href='/bbs/job/sy.asp?SessionID=" & SessionID & "'>&gt;放弃&lt;</a><br/>"
  end if
%>
<% 
Response.write "-------------<br/><a href='/bbs/job/sy.asp?SessionID="&SessionID&"'>返回商场广场</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set conn=nothing
%>