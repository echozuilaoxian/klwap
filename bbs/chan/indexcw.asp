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
<card id="main" title="宠物餐厅">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
lasttlls="59"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>带宠物来到餐厅<br/>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=7"
End if
%>
您现在的金币有:<% =objgbrs("usejf") %>
<br/>选择食物>>
<br/><a href="1cw.asp?SessionID=<%=SessionID%>">鸡蛋</a>
 <a href="3cw.asp?SessionID=<%=SessionID%>">白粥</a>
 <a href="2cw.asp?SessionID=<%=SessionID%>">排骨</a>
<br/><a href="4cw.asp?SessionID=<%=SessionID%>">鲤鱼</a>
 <a href="5cw.asp?SessionID=<%=SessionID%>">汉堡</a>
 <a href="6cw.asp?SessionID=<%=SessionID%>">牛肉</a>
<br/><a href="7cw.asp?SessionID=<%=SessionID%>">羊肉</a>
 <a href="8cw.asp?SessionID=<%=SessionID%>">龙虾</a> 
 <a href="9cw.asp?SessionID=<%=SessionID%>">神仙果</a>
<br/>--------------
<br/><a href='/bbs/reg/cwsm.asp?SessionID=<%=SessionID%>'>等级说明>></a>
<%
response.write "<br/><a href='/bbs/chan/cwxy.asp?SessionID=" & SessionID & "'>宠物沐浴>></a>"%>
<br/><a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
