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
<card id="card1" title="我的聊室积分状态">
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
lasttlls="328"
lasttls
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select usename,roomjfjf from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?8=8"
End if
Response.write "" & converttowidebaiti(objgbrs("usename"))&"你的<br/>聊室积分是:" & objgbrs("roomjfjf")&"<br/>"
Response.write "发言大于2字得2积分<br/>---------------<br/>"
Response.write "积分兑换：<a href='/bbs/room/dh/bankzb.asp?SessionID=" & SessionID & "'>金币</a><br/>"
Response.write "积分兑换：<a href='/bbs/room/dh/bankml.asp?SessionID=" & SessionID & "'>魅力</a><br/>"
Response.write "积分兑换：<a href='/bbs/room/dh/banktl.asp?SessionID=" &SessionID & "'>体力</a><br/>"
Response.write "积分兑换：<a href='/bbs/room/dh/banksm.asp?SessionID=" & SessionID & "'>生命</a>宠物<br/>"
Response.write "积分兑换：<a href='/bbs/room/dh/bankrq.asp?SessionID=" & SessionID & "'>热情</a>宠物<br/>"

Response.write "---------------<br/><a href='/bbs/friandbook/myfriendroom.asp?SessionID=" & SessionID & "'>邀请好友聊天</a><br/>"
Response.write "<a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>返回社区聊室</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID& "'>返回社区首页</a></p></card></wml>"

objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

%>


