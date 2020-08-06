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
<card id="main" title="我的头衔">
<p align="left">
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
dim objgbrs,ssql
   set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn

if objgbrs.eof then
Response.write "没有该用户<br/>"
else
Response.write "您好:<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新留言</a>"
End if
%>
<%

Response.write "<br/>您的头衔:"
if objgbrs("lasttime")-objgbrs("regtimes")<1 then
Response.write "娃娃"
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1 and  objgbrs("lasttime")-objgbrs("regtimes")<10 then
Response.write "<img src='/bbs/reg/shao/2.gif' alt='下士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/1.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/1.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=10 and  objgbrs("lasttime")-objgbrs("regtimes")<50 then
Response.write "<img src='/bbs/reg/shao/3.gif' alt='中士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/3.gif' alt='我的头衔'/><br/><a href='/bbs/reg/shao1/3.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=50 and  objgbrs("lasttime")-objgbrs("regtimes")<100 then
Response.write "<img src='/bbs/reg/shao/4.gif' alt='上士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/4.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/4.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=100 and  objgbrs("lasttime")-objgbrs("regtimes")<150 then
Response.write "<img src='/bbs/reg/shao/5.gif' alt='少校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/5.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/5.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=150 and  objgbrs("lasttime")-objgbrs("regtimes")<200 then
Response.write "<img src='/bbs/reg/shao/6.gif' alt='中校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/6.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/6.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=200 and  objgbrs("lasttime")-objgbrs("regtimes")<250 then
Response.write "<img src='/bbs/reg/shao/7.gif' alt='大校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/7.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/7.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=250 and  objgbrs("lasttime")-objgbrs("regtimes")<300 then
Response.write "<img src='/bbs/reg/shao/8.gif' alt='少尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/8.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/8.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=300 and  objgbrs("lasttime")-objgbrs("regtimes")<400 then
Response.write "<img src='/bbs/reg/shao/9.gif' alt='中尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/9.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/9.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=400 and  objgbrs("lasttime")-objgbrs("regtimes")<600 then
Response.write "<img src='/bbs/reg/shao/10.gif' alt='上尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/10.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/10.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=600 and  objgbrs("lasttime")-objgbrs("regtimes")<800 then
Response.write "<img src='/bbs/reg/shao/11.gif' alt='少将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/11.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/11.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=800 and  objgbrs("lasttime")-objgbrs("regtimes")<1000 then
Response.write "<img src='/bbs/reg/shao/12.gif' alt='中将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/12.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/12.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1000 and  objgbrs("lasttime")-objgbrs("regtimes")<1200 then
Response.write "<img src='/bbs/reg/shao/13.gif' alt='大将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/13.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/13.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1200 and  objgbrs("lasttime")-objgbrs("regtimes")<6000 then
Response.write "<img src='/bbs/reg/shao/14.gif' alt='元帅'/>"
if objgbrs("id")=Session("useid") then
Response.write "<br/><img src='/bbs/reg/shao1/14.gif' alt='我的头衔' /><br/><a href='/bbs/reg/shao1/14.gif?SessionID=" & SessionID & "'>下载头衔</a>"
end if
end if
End if
%>
<br/>
-------------<br/><%
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>+|个人资料</a>"%>

<br/>
<a href='/bbs/reg/txsm.asp?SessionID=<%=SessionID%>'>+|头衔说明</a>
<br/>

<a href='/bbs/school/school.asp?SessionID=<%=SessionID%>'>+|社区学府</a>
<br/>-------------<br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>返回社区首页</a><br/>
报时:<%=time%>
</p>
</card>
</wml>