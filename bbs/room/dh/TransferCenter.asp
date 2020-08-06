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
<card id="card1" title="兑换中心">
<p align="left">
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="201"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "y=8"
End if
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select roomjfjf,usejf,myzuan,rmb from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
%>
我的积分状态
<br/>-------------
<br/>您现有金币:<b><u><% =objgbrs("usejf") %></u></b>枚
<br/>您现有社币:<b><u><% =objgbrs("myzuan") %></u></b>枚
<br/>您现有元宝:<b><u><% =objgbrs("rmb") %></u></b>个
<br/>您聊室积分:<b><u><% =objgbrs("roomjfjf") %></u></b>分
<br/>-------------
<br/>1.<a href='/bbs/room/dh/myzuan.asp?SessionID=<%=SessionID%>'>金币转换社币</a>
<br/>2.<a href='/bbs/room/dh/myzuana.asp?SessionID=<%=SessionID%>'>社币转换金币</a>
<br/>3.<a href='/bbs/room/dh/myRMB.asp?SessionID=<%=SessionID%>'>社币转换元宝</a>
<br/>4.<a href='/bbs/room/dh/myRMBa.asp?SessionID=<%=SessionID%>'>元宝转换社币</a>
<br/>5.<a href='/bbs/reg/myroom.asp?SessionID=<%=SessionID%>'>聊室积分转换金币</a>
<br/>-------------
<br/><a href='/bbs/MyAccount.asp?SessionID=<%=SessionID%>'>返回我的帐户</a>
<%
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
Set objgbrs= Nothing
conn.close
set conn=nothing
%>

