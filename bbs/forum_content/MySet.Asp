<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="论坛功能">
<p align="left">
论坛功能<br/>------------
<%
SessionID=request.querystring("SessionID")
dim id,page,ForumID
page=request("page")
id=request("id")
iduse=Session("useid")
ForumID=request("ForumID")
if page<1 OR PAGE="" then page=1

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&""
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
  	response.end
      else
        Session("ltlybz")=""
    End if

if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=" & forumID & "&amp;page="&page&""
End if

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
Response.write "<br/><a href='/BBS/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>+|个性设置</a>"
Response.write "<br/><a href='/BBS/forum_content/editcl.asp?SessionID=" & SessionID & "'>+|全坛搜贴</a><br/>"
Response.write "<a href='/BBS/forum_content/ess.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|本坛搜贴</a>"

if Cstr(Session("gly"))=ForumID and Session("bzbz")=""  then
'Response.write "<br/><a href='/bbs/anther/gaojxbz.asp?rd=" & ForumID & "&amp;SessionID=" & SessionID & "'></a>+|副版工资"
End if
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>=版主功能=<br/>"

Response.write "<a href='/BBS/anther/gaozcl11.asp?rd=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|领取工资</a><br/>"
Response.write "<a href='/BBS/public/banzhu.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|封锁操作</a><br/>"
Response.write "<a href='/BBS/public/banzhu2.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|解锁操作</a><br/>"
Response.write "<a href='/BBS/Forum_content/ContentlisT.Asp?ForumID=28&amp;SessionID=" & SessionID & "'>+|斑竹交流</a><br/>"
Response.write "<a href='/BBS/public/bbbz.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>+|解权操作</a><br/>"
'Response.write "<a href='/BBS/public/22.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>+|任命副版</a><br/>"
Response.Write "<a href='BBS_bksz.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|修改版块</a>"
End if
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>=管理员功能="
Response.write "<br/><a href='/BBS/public/bbbz.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>+|解权操作</a>"
Response.Write "<br/><a href='BBS_bksz.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|修改版块</a>"
Response.Write "<br/><a href='zyltwz.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+|转移帖子</a>"
End if
Response.write "<br/><a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;Sort=7&amp;SessionID=" & SessionID & "'>+|我在" & dlname & "的帖子</a>"
Response.write "<br/>------------"
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a>"
Response.write "<br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set conn=nothing
%>
