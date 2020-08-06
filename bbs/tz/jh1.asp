<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="删除挑战记录">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
iduse=Session("useid")
Session("returnuppath")="/bbs/marry/jc.asp?"
gfdsa=Session("ltname")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新留言</a><br/><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
End if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry where [useid]=" & iduse & " and [open]=0 order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
Response.write "出错了！没有你的挑战记录哦！<br/>"
   else

%>
你确认删除你发起的挑战记录吗？
<br/>[温馨提示]删除挑战记录，将对你发起的所有挑战记录一起删除，但比赛不会因此而结束！
<br/><br/>
<a href='jh.asp?SessionID=<%=SessionID%>&amp;xx=<%=xx%>'>是的，我确定</a><br/>
<a href='lb0.asp?SessionID=<%=SessionID%>&amp;xx=<%=xx%>'>哦，不了</a><br/><br/>
<%end if%>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
-----------<br/>

<a href="/bbs/index.asp?SessionID=<%=SessionID%>">&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>

<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>