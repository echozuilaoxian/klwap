<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<card id="card1" title="消息中心"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
iduse=Session("useid")
lasttlls="167"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
End if
  id=Session("useid")

Response.write "<a href='/bbs/public/main_fs.asp?SessionID=" & SessionID & "'>编写消息</a><br/>"
Response.write "<a href='main_ckly.asp?SessionID=" & SessionID & "'>收件箱</a><br/>"
Response.write "<a href='fx.asp?SessionID=" & SessionID & "'>发信箱</a><br/>"
Response.write "<a href='/bbs/public/main_bao.asp?SessionID=" & SessionID & "'>收藏箱</a><br/>"
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/>"
Response.write "------------<br/>"
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "=vip特权=<br/><a href='/bbs/public/zxqf.asp?SessionID=" & SessionID & "'>在线群发</a>"
Response.write "<br/>------------<br/>"
end if
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
end if 
Response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/>"
Response.Write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
%>
<br/>时间:<%=time%>
<%
Response.write "</p></card></wml>"

conn.close
set conn=nothing
%>