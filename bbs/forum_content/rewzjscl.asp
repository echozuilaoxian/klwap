<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
dim memo,ids,id,page,pages,forumID
   forumID=request("forumID")

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

   page=request("page")
   pages=request("pages")
   id=request("id")
   ids=request("ids")
   memo=request.form("memo")
   memo=untowide(memo)
  if memo="" then
    response.write "<card id='card1' title='续写错误'><p>"
    response.write "文章内容不能为空!<br/><a href='rewzjs.asp?forumID=" & forumID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
    response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse& "</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    response.end
Else
  iduse=Session("useid")
  sql="update lthf set name=name+'" & memo & "' Where CStr(ids)='" & ids & "' and tjhm='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='续写成功' ontimer='/BBS/Forum_content/Receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=1&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write"续写成功，正在返回...<br/><a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=1&amp;SessionID=" & SessionID & "'>返回回复列表</a>"

  response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse& "</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
  End if
%>