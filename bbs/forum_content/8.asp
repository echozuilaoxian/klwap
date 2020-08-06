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
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
dim ltlyuans
  iduse=Session("useid")
  ForumID=Cstr(request("ForumID"))

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

acc=request("acc")
if acc="" then
%>
<card id='card1' title='清空捐款记录'><p>确定全部清空?<br/><a href='8.asp?acc=1&amp;ForumID=<% =ForumID %>&amp;SessionID=<%=SessionID%>'>是</a> <a href='1.asp?ForumID=<% =ForumID %>&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
else
  Application.lock
  sql="delete from marry Where CStr(about)='" & ForumID & "'"
  Application.Lock
  conn.Execute(sql)
ltlyuans="清空" & dlname & "的所以捐款记录"
 sql="insert into jfpost2(ids,reids,naiyo)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(ForumID) & ","
  sql=sql & sqlstr(ltlyuans) & ")"
  conn.execute sql
  Application.Unlock
  response.write "<card id='card1' title='清空捐款记录' ontimer='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='5'/><p align='left'>成功清空捐款记录，正在返回...<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
end if
%>



