<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="家园"><p align="left">
<%session.abandon%>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
if Session("zh")="abcyi" then
 Response.write " 请您<a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>登陆/注册</a><br/>"
else
Response.write " <a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'><img src='/bbs/xhjy/id.gif' alt=''/>"& iduse &"</a>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/xx.gif' alt=''/>信息("&lycount&")</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
else
Response.write " <a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/jy.gif' alt=''/>地盘</a><br/>"
end if
end if
       set obj=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where id=" & id & ""
       obj.open ssql,conn
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyhome where jyid=" & id & ""
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误，无此家园."
else
Response.write "<a href='/bbs/xhjy/home.asp?id="&id&"&amp;SessionID="&SessionID&"'>家园</a>.<a href='/bbs/hua/index.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a><br/>[主人]:<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>" & obj("usename")&"" &"(" & obj("id")&")</a><br/>名称:" & objgbrs("jyname") & "<br/>公告:" & objgbrs("jygg")&"<br/>迎词:" & objgbrs("jyhy") & "<br/>简介:" & objgbrs("jyjj")&""
end if
Response.write "<br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>主人家园</a>>家园资料<br/>"
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>