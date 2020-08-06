<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<%
  dim itid, name,memo
  itid=request("itid")
tjhm=Session("useid") 
  memo=request("memo")  
  memo=trim(memo)
  btzz=Session("ltname")
  memo=untowide(memo)
  sql="insert into wuzayy(tjhm,btzz,naiyo)values("
  sql=sql & sqlstr(tjhm) & ","
  sql=sql & sqlstr(btzz) & ","
  sql=sql & sqlstr(memo) & ")"
  Application.Lock
  conn.execute sql
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='发表成功!' ontimer='zcwwbb.asp?itid=1&amp;wap=" & wap & "'><timer value='10'/><p align='left'>"
  response.write "发表成功，正在返回...<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
%>



