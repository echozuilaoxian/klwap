<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
wap=request.querystring("wap")
iduse=Session("useid")
 id=request("id")
 ids=request("ids")
  name=request("name")
  if name="" then
     response.write "<card id='card1' title='分组管理'><p><br/>组名不能为空！<br/><a href='fzcz.asp?wap=" & wap & "'>返回重写</a><br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>回我的好友</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if id="" or ids="" then
     response.write "<card id='card1' title='分组管理'><p><br/>对不起，系统不能识别你的身份，请返回首页在创建<br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>回我的好友</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
 sql="update wry set country='" & name & "' Where CStr(idd)='" & iduse & "' and thank='"&ids&"'"
  Application.Lock
            conn.execute(sql)
Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='分组管理' ontimer='/bbs/friandbook/myfriend.asp?wap=" & wap & "'><timer value='10'/><p align='left'>成功修改,正在返回...<br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>回我的好友</a><br/><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
 %>
