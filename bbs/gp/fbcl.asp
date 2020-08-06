<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
dim talk,baoch,usename
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
baoch=1
  usename=Session("ltname")
  talk=trim(request("talk"))
  talk=untowide(talk)
 if Session("ltftzl")=talk then
     response.write "<card id='card1' title='发布股市消息'><p>请不要重复发布消息！！<br/><a href='index.asp?SessionID=" & SessionID & "'>股市</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
     response.end
  End if
        Session("ltftzl")=talk
		Session.Timeout=10
  if talk="" then
     response.write "<card id='card1' title='发布股市消息'><p>消息内容不能为空！<br/><a href='fb.asp?SessionID=" & SessionID & "'>返回重写</a><br/><a href='index.asp?SessionID=" & SessionID & "'>股市</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
     response.end
  End if
  sql="insert into gproom(usename,talk,baoch)values("
  sql=sql & sqlstr(usename) & ","
  sql=sql & sqlstr(talk) & ","
  sql=sql & sqlstr(baoch) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
     response.write "<card id='card1' title='发布股市消息' ontimer='index.asp?SessionID=" & SessionID & "'><timer value='1'/><p>发布成功,正在返回...<br/><a href='index.asp?SessionID=" & SessionID & "'>股市</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



