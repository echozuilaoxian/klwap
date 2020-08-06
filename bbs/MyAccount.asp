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
<card id="card1" title="我的帐户">
<p align="left">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="201"
lasttls
rmb=request("rmb")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select usename,rmb,id,usephone from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "y=8"
End if
Response.write "社区ID&#65306;" & CStr(objgbrs("id"))&"<br/>昵称:" & converttowide(objgbrs("usename"))&"<br/>手机号码:" & objgbrs("usephone") & ""
%>
<%
Response.write "<br/>-------------<br/>可用余额:￥" & objgbrs("rmb")&"元<br/>-------------"
%>
<%
if objgbrs("rmb")>49 Then
response.Write "<br/><a href='/bbs/MyAccount50.asp?SessionID=" &SessionID & "'>申请50元电话卡</a><br/>-------------"
else
response.Write "<br/>帐户余额不足<br/>-------------"
end if
response.Write "<br/><a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>返回积分兑换</a>"
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>


