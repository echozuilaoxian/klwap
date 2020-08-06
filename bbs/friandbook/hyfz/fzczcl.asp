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
SessionID=request.querystring("SessionID")
iduse=Session("useid")
 id=request("id")
  zuname=request("zuname")
  memo=request("memo")
  if zuname="" or memo="" then
     response.write "<card id='card1' title='创建分组'><p>组名和排序不能为空！<br/><a href='fzcz.asp?SessionID=" & SessionID & "'>返回重写</a><br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>回我的好友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>回社区首页</a></p></card></wml>"
     response.end
  End if
if id="" then
     response.write "<card id='card1' title='创建分组'><p><br/>对不起，系统不能识别你的身份，请返回首页在创建<br/><a href='fzcz.asp?SessionID=" & SessionID & "'>返回重写</a><br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" &SessionID& "'>回我的好友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="insert into wry(idd,country,thank)values("
 sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(zuname) & ","
  sql=sql & sqlstr(memo) & ")"
  Application.Lock
  conn.execute sql
 sql="update myfriend set uid=uid+1 Where CStr(ids)='" & iduse & "'"
            conn.execute(sql)
Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='创建分组' ontimer='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'><timer value='10'/><p align='left'>成功创建分组,正在返回...<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>回我的好友</a><br/><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>回社区首页</a></p></card></wml>"
 %>
