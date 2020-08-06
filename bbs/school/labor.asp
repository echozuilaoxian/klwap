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
<card id="main" title="参加劳动">
<p align="left">
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="156"
lasttlls="156"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "你好,<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowide(gfdsa) & "</a>"
Response.write "<br/><a href='/bbs/mysx.asp?SessionID=" & SessionID & "'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
 %>
<br/>---------
<br/><a href='hua.asp?SessionID=<%=SessionID%>'>关爱生命-浇花</a>
<br/><a href='shu.asp?SessionID=<%=SessionID%>'>绿化环境-种树</a>
<br/><a href='di.asp?SessionID=<%=SessionID%>'>美化学校-扫地</a>
<br/><a href='ren.asp?SessionID=<%=SessionID%>'>尊老爱幼-助人</a>
<% 
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
%>


