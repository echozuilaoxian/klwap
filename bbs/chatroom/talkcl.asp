<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
dim talk,baoch,usename,forname,show,ids
SessionID=request.querystring("SessionID")
  show=request("show")
  itid=request("itid")

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&itid
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=converttowidebaiti(rse("biaoti"))
end if
rse.close
Set rse= Nothing
  forname=request("forname")
  usename=Session("ltname")
  talk=trim(request("talk"))
  talk=untowide(talk)
  ids=request("ids")
 if ids="" then 
ids="0"
end if
 if Session("ltftzl")=talk then
     response.write "<card id='card1' title='&#21457;&#35328;'><p>请不要刷屏！！"
     response.write "<br/><a href='chatroom.asp?itid="&itid&"&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>" & bkmc & "聊室</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
        Session("ltftzl")=talk
		Session.Timeout=10
  if talk="" then
     response.write "<card id='card1' title='&#21457;&#35328;'><p>发言内容不能为空！"
     response.write "<br/><a href='talk.asp?itid="&itid&"&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
  sql="insert into room(usename,forname,talk,baoch)values("
  sql=sql & sqlstr(usename) & ","
  sql=sql & sqlstr(forname) & ","
  sql=sql & sqlstr(talk) & ","
  sql=sql & sqlstr(itid) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
  conn.close
  set conn=nothing
     response.write "<card id='card1' title='&#21457;&#35328;' ontimer='chatroom.asp?itid="&itid&"&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'><timer value='1'/></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



