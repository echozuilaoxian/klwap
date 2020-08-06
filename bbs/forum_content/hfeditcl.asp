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
wap=request.querystring("wap")
dim memo,page,forumID,id,name,pagezz,Contentf,Contentup,con
   pagezz=request("pagezz")
  forumID=request("forumID")
   SessionID=request("SessionID")
   page=request("page")
ids=request("ids")
   id=request("id")
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

   memo=request("memo")
   memo=untowide(memo)
    if memo="" then
    response.write "<card id='card1' title='编辑回复'><p>"
    response.write "内容不能为空！<br/><a href='hf.asp?forumID=" & forumID & "&amp;pagezz=" & pagezz & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
    response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a></p></card></wml>"
    response.end
  End if
  iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from lthf Where CStr(ids)='" & ids &"' and tjhm='" & iduse & "' and id='" & id & "'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
showwz=CLng(Session("showwz"))
moy=request("moy")
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
end if
Contentup = left(Content,StartWord+pagezz*PageWordNum-1)
con=Length-(StartWord+pagezz*PageWordNum+PageWordNum-1)
if con>0 then
    Contentf = right(Content,con)
  else
    Contentf = ""
end if
memo=Contentup & memo & Contentf
  sql="update lthf set name='" & memo & "' Where CStr(ids)='" & ids & "' and tjhm='" & iduse & "'and id='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  response.write "<card id='card1' title='编辑回复' ontimer='/BBS/Forum_content/rezcwwcl.asp?forumID=" & forumID & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='5'/><p align='left'>编辑成功，正在返回...<br/>"
  response.write "<a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?forumID=" & forumID & "&amp;id=" & id& "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看文章</a>"

Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
%>