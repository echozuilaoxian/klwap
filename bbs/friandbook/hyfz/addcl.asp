<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
   useid=request("useid")
   idd=request("idd")
  sql="update myfriend set useid='"& idd & "' Where CStr(friid)='" & useid & "' and ids='"&iduse&"'"
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='转移好友' ontimer='/bbs/friandbook/myfriend.asp?SessionID=" &SessionID& "'><timer value='10'/><p align='left'>转移好友成功！<br/><a href='/bbs/friandbook/myfriend.asp?idd=" & idd & "&amp;SessionID=" &SessionID & "'>回我的好友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>回社区首页</a></p></card></wml>"
%>




