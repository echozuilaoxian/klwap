<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("Counter")="pass_numbers_55556666" then
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
zb=request("zb")
 zb=Clng(zb)
ForumID=request("ForumID")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

%>
<%
 if zb="" then
     response.write "<card id='card1' title='管理员操作'><p><br/>金币不能为空！<br/>----------<br/><a href='6.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if zb>10000001 then
     response.write "<card id='card1' title='管理员操作'><p><br/>太多啦,请写小于10000000个金币<br/>----------<br/><a href='6.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if ForumID="" then
     response.write "<card id='card1' title='管理员操作'><p><br/>系统不能识别你的身份，请返回重填。<br/>----------<br/><a href='6.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
set objgbrs=Server.CreateObject("ADODB.Recordset")
conn.CommandTimeOut = 999
ssql="select * from sn_dat where des='" & ForumID &"'"
objgbrs.open ssql,conn,1,1
if objgbrs.eof then
 sql="insert into marry(useid,about,reuseid)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(ForumID) & ","
  sql=sql & sqlstr(zb) & ")"
  Application.Lock
  conn.execute sql
sql="insert into sn_dat(num,des)values("
  sql=sql & sqlstr(zb) & ","
  sql=sql & sqlstr(ForumID) & ")"
  Application.Lock
  conn.execute sql
sql="update jzbl set hfcontd=hfcontd+" & zb & " Where CStr(itid)='" & ForumID & "'"
 Application.Lock
  conn.Execute(sql)
  Application.Unlock
response.write "<card id='card1' title='管理员操作' ontimer='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='500'/><p align='left'>操作成功！"&dlname&"增加<u>" & zb & "</u>枚金币<br/>-----------<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
else
sql="update jzbl set hfcontd=hfcontd+" & zb & " Where CStr(itid)='" & ForumID & "'"
 Application.Lock
  conn.Execute(sql)
 sql="update sn_dat set num=num+" & zb & " Where CStr(des)='" & ForumID & "'"
  conn.execute sql
  Application.Unlock
objgbrs.close
  set objgbrs=nothing
  conn.close
  set conn=nothing
 response.write "<card id='card1' title='管理员操作' ontimer='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='500'/><p align='left'>操作成功！"&dlname&"增加<u>" & zb & "</u>枚金币<br/>-----------<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
end if
%>