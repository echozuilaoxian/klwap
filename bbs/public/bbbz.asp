<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="172"
lasttls

  dim page,bz,objgbrs,ForumID
ForumID=request("ForumID")
page=request("page")
if page<1 OR PAGE="" then page=1

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
<card id="card1" title="<%=dlname%>-版务人员列表"><p>
<%
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(bzbz)=" & ForumID & " and Cstr(gly)<>'0' order by id"
  objgbrs.open ssql,conn,1,3
%>
<%
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=" & forumID & "&amp;page="&page&""
End if

Response.write "【主版列表】<br/>"
if objgbrs.eof then
   Response.write "暂无记录<br/>"
 Else
i=1
For k=1 to 10
Response.write ""&i&".<a href='/bbs/public/fsly.asp?ids=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename"))  & "ID:" & objgbrs("id") & "</a>|"
Response.write "<a href='/bbs/reg/bzcj.asp?id=" & objgbrs("id") & "&amp;forumID=" & forumID & "&amp;SessionID=" & SessionID & "'>成绩</a>"
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "|<a href='/bbs/public/resetbzcl.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>撤消</a>"
end if
Response.write "<br/>"
i=i+1
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if

 set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(gly)=" & ForumID & " and Cstr(bzbz)='0' order by id"
  objgbrs.open ssql,conn,1,3
Response.write "【副版列表】<br/>"
if objgbrs.eof then
   Response.write "暂无记录<br/>"
 Else
j=1
For k=1 to 10
bihaocont=bihaocont+1
Response.write ""&j&".<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename"))  & "ID:" & objgbrs("id") & "</a>"
if Cstr(Session("gly"))=ForumID and Session("bzbz")=""  then
Response.write "|<a href='/bbs/anther/gaojxbz.asp?id=" & objgbrs("id") & "&amp;rd=8&amp;SessionID=" & SessionID & "'>领薪</a>"
end if
if Cstr(Session("yxxezb"))<>"" or Session("bzbz")=ForumID or Session("Counter")="pass_numbers_55556666" then
Response.write "|<a href='/bbs/public/mbgzry.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>撤消</a>"
end if
Response.write "<br/>"
j=j+1
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "-------------<br/><a href='/bbs/public/bzgz.asp?SessionID=" & SessionID & "'>+|版主须知</a>"
Response.write "<br/><a href='/bbs/sqbz/index.asp?SessionID=" & SessionID & "'>+|新手须知</a>"
Response.write "<br/>-------------<br/>"
Response.write "<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回社区功能</a>"
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & converttowidebaiti(dlname) & "</a>"
Response.write "<br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

conn.close
set objgbrs=nothing
set conn=nothing
%>