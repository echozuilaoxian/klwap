<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
itid=request("itid")
Session("returnuppath")=""
  dim id,page
  page=request("page")
  id=Request("id")
  sql="update myalbum set mei=mei+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
response.write "<card id='card1' title='投票成功' ontimer='myalbum.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write "谢谢你的称赞，正在返回...<br/><a href='myalbum.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>返回相册</a></p></card></wml>"
objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
%>



