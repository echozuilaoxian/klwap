<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
dim talk,baoch,usename,forname,show
wap=request.querystring("wap")
  show=request("show")
  forname=request("forname")
  usename=Session("ltname")
  ids=Session("useid")
  talk=trim(request("talk"))
  talk=untowide(talk)
 if Session("ltftzl")=talk then
     response.write "<card id='card1' title='&#21457;&#35328;'><p>请不要刷屏！！"
     response.write "<br/><anchor><prev/>[返回上级]</anchor></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
        Session("ltftzl")=talk
		Session.Timeout=10
  if talk="" then
     response.write "<card id='card1' title='&#21457;&#35328;'><p>对不起，讲话内容不能为空！"
     response.write "<br/><anchor><prev/>[返回上级]</anchor></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
  sql="insert into room2(usename,forname,ids,talk)values("
  sql=sql & sqlstr(usename) & ","
  sql=sql & sqlstr(forname) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(talk) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
 sql="update usereg set usejf=usejf+3 where CStr(id)=" & Session("useid")
  Application.Lock
  conn.execute sql
  Application.Unlock	
  conn.close
  set conn=nothing
     response.write "<card id='card1' title='&#21457;&#35328;' ontimer='chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'><timer value='1'/></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



