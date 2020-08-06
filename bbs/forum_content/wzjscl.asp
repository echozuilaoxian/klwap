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
SessionID=request.querystring("SessionID")
dim memo,page,ForumID
   ForumID=request("ForumID")
   page=request("page")
   id=request("id")
   pic=request("pic")
   memo=request.form("memo")
   memo=untowide(memo)
    if memo="" then
    response.write "<card id='card1' title='续写文章'><p>"
    response.write "文章内容不能为空！<br/><a href='/BBS/Forum_content/Forum_wzjs.asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>返回继续操作</a>"
  response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看文章</a>"
    response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回当前版块</a><br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    response.end
  End if
   if Session("ltftzl")=memo then
     response.write "<card id='card1' title='续写文章'><p>"
     response.write "您已续写成功，请不要重复。<br/><a href='/BBS/Forum_content/Forum_wzjs.asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>返回继续操作</a>"
  response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看文章</a>"
    response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回当前版块</a><br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    response.end
    End if
        Session("ltftzl")=memo
		Session.Timeout=10
  iduse=Session("useid")
  if pic<>"" then
  sql="update wuza set pic='" & pic & "' Where CStr(id)='" & id & "' and tjhm='" & iduse & "'"
  End if
		Dim Bian_FSO,Bian_FS
		Set Bian_FSO=Server.CreateObject("Scripting.FileSystemObject")
		Set Bian_FS=Bian_FSO.OpenTextFile(Server.Mappath("File/File/"&ID&".txt"),8,True)
		Bian_FS.Write(memo)
		Bian_FS.Close
		Set Bian_FS=Nothing
		Set Bian_FSO=Nothing

  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='成功续写文章' ontimer='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='5'/><p align='left'>续写成功，正在返回...<br/>"
  response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看文章</a>"
    response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回当前版块</a><br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    %>