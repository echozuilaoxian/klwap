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

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&ForumID
rse.open rspple,conn,1,2
if rse.eof then
dlname="无此帮派"
else
dlname=converttowidebaiti(rse("biaoti"))
yxxes=rse("tjhm")
end if
rse.close
Set rse= Nothing
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
ssql="select * from sn_datb where cstr(des)='" &ForumID&"'" 
objgbrs.open ssql,conn,1,1
if objgbrs.eof then
if Session("useid")=yxxes then
Response.write "<anchor>开通基金堂<go method='post' href='1001.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><postfield name='name' value='0'/></go></anchor><br/>"
else
Response.write "帮主还没开通基金堂呢<br/>"
end if
else
Response.Write "当前基金:" & objgbrs("num")&"<br/>"
Response.Write "<a href='/BBS/1002.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>我要捐款</a><br/>"

if Session("useid")=yxxes then
Response.write "<a href='/BBS/1004.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>奖励用户</a><br/>"
end if
end if
Response.write "-------------<br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"

objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
