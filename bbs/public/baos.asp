﻿<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
  dim id,page,pages
  pages=request("pages")
  id=request("id")
  page=request("page")
  sql="update guestbook set bz=0 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn
Response.Write "<card id='card1' title='取消保存' ontimer='ckly.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'><timer value='5'/><p>"

if CStr(objgbrs("ids"))<>CStr(Session("useid")) then
Response.end
end if
response.write "取消保存成功!!正在返回..."
response.write "<br/><a href='ckly.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>回收件箱</a>"
if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>回上一级</a>"
  Else
   Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
End if
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>





