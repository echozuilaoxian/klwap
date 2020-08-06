<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
ForumID=request("ForumID")

if Clng(ForumID)<1 then
   Rresponse.end
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
%>
<%
Response.Write "<card id='card1' title='" & dlname & "-基金堂'><p>" & dlname & "基金堂<br/>-------------<br/>"
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
End if
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & ""
lasttlss=ForumID
lasttlls=ForumID
lasttls
dim jdshow,p
jdshow=CLng(Session("showjd"))
set objgbrs=Server.CreateObject("ADODB.Recordset")
conn.CommandTimeOut = 999
ssql="select * from sn_dat where cstr(des)='" &ForumID&"'" 
objgbrs.open ssql,conn,1,1
if objgbrs.eof then
Response.Write "没有该基金<br/>"
else
Response.Write "当前基金:" & objgbrs("num")&"<br/><a href='2.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[我要捐款]</a><br/>"
Response.Write "<a href='1jkjl.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[捐款记录]</a><br/>"
Response.Write "<a href='1czjl.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[操作记录]</a><br/>"

if Cstr(Session("bzbz"))=ForumID or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>-=版主功能=-<br/>"
Response.write "<a href='5.asp?ForumID=" & ForumID & "&amp;rd=8&amp;SessionID=" & SessionID & "'>[领取基金]</a><br/>"
Response.write "<a href='4.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[奖励用户]</a><br/>"
end if
end if
if Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>-=管理功能=-<br/>"
Response.write "<a href='6.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[基金补助]</a><br/>"
Response.write "<anchor>[清空基金]<go method='post' href='7.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><postfield name='name' value='0'/></go></anchor>点击清空<br/>"
Response.write "<a href='8.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>[清空捐款记录]</a>"
end if
Response.write "<br/>-------------<br/><a href='/BBS/Forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/ztlb.asp?SessionID=" & SessionID & "'>返回论坛导航</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"

objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
