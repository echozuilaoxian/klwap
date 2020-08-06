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
 	dim forumID,setbzcz
	forumID=request("forumID")
	setbzcz=request("setbzcz")
set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&setbzcz
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamses="无此论坛"
Else
dlnamses=objgbrssy("name")
end if
objgbrssy.close
Set objgbrssy= Nothing
%>
<%
if Session("Counter")="pass_numbers_55556666" then 
sql="update wuza set itid='" & setbzcz & "' where CStr(itid)='" & forumID & "'"
conn.execute(sql)

set objgbrssxy=Server.CreateObject("ADODB.Recordset")
rsplzs="select * from sclt where id="&forumID
objgbrssxy.open rsplzs,conn,1,2
if objgbrssxy.eof then
dlnamsex="无此论坛"
Else
dlnamsex=objgbrssxy("name")
end if
objgbrssxy.close
Set objgbrssxy= Nothing
End if
conn.close
set conn=nothing
Response.write "<card id='card1' title='成功转移至"&dlnamses&"'><p>"
Response.write "成功转移<b>"&dlnamsex&"</b>所有帖子至<b>"&dlnamses&"</b>"
Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?forumID=" & setbzcz & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")& "" & converttowidebaiti(dlnamses) & "</a>"
Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?forumID=" & forumID & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")& "" & converttowidebaiti(dlnamsex) & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("返回社区首页")& "</a></p></card></wml>"
%>