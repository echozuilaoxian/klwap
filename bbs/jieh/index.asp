<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="婚姻登记处">
<p align="center"><img src='/bbs/logo/JH.gif' alt="婚姻登记处"/><br/>
在我最美丽的时刻,为这我已在佛前求了五百年,求他让我们结一段尘缘。<br/>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?8=8"
End if
%>
<a href='/bbs/jieh/jie.asp?SessionID=<%=SessionID%>'>我要求婚</a>
<br/><a href='/bbs/jieh/lhun.asp?SessionID=<%=SessionID%>'>申请离婚</a>
<br/><a href='/bbs/jieh/jiefbb.asp?SessionID=<%=SessionID%>'>求婚列表</a>
<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=25&amp;SessionID=<%=SessionID%>'>征婚论坛</a>
<br/>-----------
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>我的地盘</a>|<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>