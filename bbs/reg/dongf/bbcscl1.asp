<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
id=Session("useid")
  sql="update usereg set usejf=usejf-99,myjy=myjy+100,myfq=myfq-15  Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  response.write "<card id='card1' title='登记BB资料' ontimer='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>恭喜！你们的宝宝出生拉。<br/><a href='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'>个人资料</a></p></card></wml>"
conn.close
set conn=nothing
%>



