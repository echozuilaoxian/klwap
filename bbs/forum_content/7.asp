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
if Session("Counter")="pass_numbers_55556666" then
SessionID=request.querystring("SessionID")
  dim name
  ForumID=Cstr(request("ForumID"))
   if Clng(ForumID)<1 then
       response.end
   End if
  name=request("name")
des=request("ForumID")
  name=left(name,5)
  name=trim(name)
  name=untowide(name)
  if name="" then
     response.write "<card id='card1' title='论坛基金'><p><br/>数量不能为空<br/><a href='1.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回重写</a></p></card></wml>"
     response.end
  End if
  sql="insert into sn_dat(des,num)values("
  sql=sql & sqlstr(ForumID) & ","
  sql=sql & sqlstr(name) & ")"
  Application.Lock
  conn.execute sql
sql="update jzbl set hfcontd=0 Where CStr(itid)='" & des & "'"
  Application.Lock
  conn.Execute(sql)
          sql="update sn_dat set num=0 where CStr(des)='" & ForumID & "'"
  conn.Execute(sql)
  Application.Unlock

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
  conn.close
  set conn=nothing
 response.write "<card id='card1' title='管理员操作' ontimer='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='500'/><p align='left'>操作成功！成功清空"&dlname&"基金<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
 %>
