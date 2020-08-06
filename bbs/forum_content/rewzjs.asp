<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id='card1' title='续写回复'>
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="142"
lasttls
dim id,ids,page,forumID,len
len=request("len")
forumID=request("forumID")
page=request("page")
pages=request("pages")
if pages="" or pages<=0 then pages=1
id=request("id")
ids=request("ids")
response.write "<p align='left'>续写内容<br/><input type='text' name='memo'/><br/>"
response.write "<anchor>提交<go method='post' href='rewzjscl.asp?SessionID=" & SessionID & "'><postfield name='memo' value='(续)$memo'/><postfield name='ids' value='" & ids & "'/><postfield name='id' value='" & id & "'/><postfield name='page' value='" & page & "'/><postfield name='forumID' value='" & forumID & "'/></go></anchor><br/>"
%>
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
response.write "<br/><a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回回复列表</a>"
Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set conn=nothing
%>
