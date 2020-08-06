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
<card id="card1" title="金币兑换社币"><p>
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
    sql="select usejf,myzuan from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
%>
你现有金币:<b><u><% =objgbrs("usejf") %></u></b>枚
<br/><b><u>10000</u></b>枚金币兑换<b><u>1</u></b>枚社币
<br/>你现有社币:<b><u><% =objgbrs("myzuan") %></u></b>枚
<br/>输入金币:
<br/><input name="myzuan" value="100" format="*N" maxlength="10"/>
<br/><anchor>[-提交-]
<go method="post" href='outclmyzuan.asp?SessionID=<%=SessionID%>'>
<postfield name="myzuan" value="$(myzuan)"/></go></anchor>
<br/>请输入整数比如10000,20000,30000...非整数系统将会吞掉零头
<br/>-------------
<%
response.Write "<br/><a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>返回积分兑换</a>"
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
Set objgbrs= Nothing
conn.close
set conn=nothing
%>


