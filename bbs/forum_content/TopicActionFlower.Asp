<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="316"
lasttls
ForumID=request("ForumID")
if Clng(ForumID)=80 and Session("yxxezb")="" and Session("yxxexc")="" and Session("bzbz")="" and Session("Counter")<>"pass_numbers_55556666" then
		conn.close		
                set conn=nothing
		response.end
End if
   if Clng(ForumID)>5000 or Clng(ForumID)<1 then
		conn.close
		set conn=nothing
		response.end
   End if
Session("returnuppath")=""
  dim id,page
  page=request("page")
  id=Request("id")
  sql="update wuza set rcx=rcx+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "<card id='card1' title='献花不成功'><p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
response.write "<card id='card1' title='献花成功!!' ontimer='/BBS/Forum_ContenT/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write "谢谢献花，正在返回...<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回当前版面</a></p></card></wml>"
objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
%>



