<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
 ids=request("ids")
if ids="" then
     response.write "<card id='card1' title='分组管理'><p><br/>分组ID错误<br/><a href='sc.asp?wap=" & wap & "'>返回重选</a><br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>回我的好友</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="delete from wry Where CStr(idd)='" & iduse & "' and thank='"&ids&"'"
 Application.Lock
            conn.execute(sql)
 sql="update myfriend set useid=0 Where CStr(ids)='" & iduse & "' and useid='"&ids&"'"
Application.Lock
            conn.execute(sql)
Application.Unlock

  response.write "<card id='card1' title='分组管理' ontimer='sc.asp?wap=" & wap & "'><timer value='10'/><p align='left'>"
  response.write "删除成功，正在返回...<br/>"
  response.write "<a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>回我的好友</a></p></card></wml>"
%>



