<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="编辑回复">
<%
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<p>你的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
dim forumID,id,page,i,ids
i=request("i")
ids=request("ids")
id=request("id")
page=request("page")
forumID=request("forumID")
moy=request("moy")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from lthf Where CStr(ids)='" & ids &"'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
showwz=CLng(Session("showwz"))
Content=objgbrs("name")
if moy="123" then
pageWordNum=10000
else
pageWordNum=showwz
End IF
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
pagezz=request("pagezz")
if isnull(pagezz) or pagezz="" then
pagezz=0
else
pagezz=request("pagezz")-1
end if
Content = mid(Content,StartWord+pagezz*PageWordNum,PageWordNum)
%>
<onevent type="onenterforward">
<refresh>
<setvar name="memo" value="<% =converttowidebaiti(Content) %>"/>
</refresh>
</onevent>
<p align="left">
编辑回复内容:
<br/><input type="text" name="memo" value="<% =converttowidebaiti(Content) %>"/>
<br/><anchor>提交
<go method="post" href='hfeditcl.asp?SessionID=<%=SessionID%>'>
<postfield name="memo" value="$(memo)"/>
<%
Response.write "<postfield name='forumID' value='" & forumID & "'/><postfield name='id' value='" & id & "'/><postfield name='ids' value='" & ids & "'/><postfield name='page' value='" & page & "'/><postfield name='moy' value='" & moy & "'/><postfield name='pagezz' value='" & pagezz & "'/>"
%>
</go>
</anchor>
<%
set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&forumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=objgbrssy("name")
end if
objgbrssy.close
Set objgbrssy= Nothing
%>
<%
response.write "<br/><a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=1&amp;SessionID=" & SessionID & "'>返回回复列表</a>"
Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set conn=nothing
set objgbrs=nothing
%>