<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="兑换金币"><p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="52"
lasttls
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select roomjfjf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 
         response.write "" & Session("ltname") & "你好!<br/>"%>
你现有积分:<% =objgbrs("roomjfjf") %>
<br/>10积分兑换1金币
<br/>输入积分:
<br/><input name="outzb" value="100" format="*N" maxlength="5"/>
<br/><anchor>提 交
<go method="post" href='outclzb.asp?SessionID=<%=SessionID%>'>
<postfield name="outzb" value="$(outzb)"/></go></anchor><br/>-------------
<%
response.Write "<br/><a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>返回积分兑换</a>"
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

Set objgbrs= Nothing
conn.close
set conn=nothing
%>






