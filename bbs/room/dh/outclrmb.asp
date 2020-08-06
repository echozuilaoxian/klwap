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
<card id="card1" title="兑换元宝"><p>
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
dim ourmb
ourmb=trim(request("ourmb"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select rmb,myzuan from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if ourmb>99 then
     ourmb=Clng(ourmb)
     if ourmb>objgbrs("myzuan") then
            msg="兑换状态:错误!<br/>你输入的社币数量大于你现有的社币数量：<br/>您只有<b><u>" & objgbrs("myzuan") & "</u></b>枚社币<br/>请重新输入兑换数量。" 
         else
            sql="update usereg set myzuan=myzuan-" & ourmb & ",rmb=rmb+" & ourmb & "*0.01,banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            Application.Unlock
            msg="兑换状态:成功!<br/>您的社币成功兑换元宝" 
     end if
   else


            msg="兑换状态:错误!<br/>100枚社币兑1个元宝,您输入的社币数量低于100枚." 
 end if

    response.write msg
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<br/>--------
<br/><anchor>返回上级<prev/></anchor>
<%
response.Write "<br/><a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>返回积分兑换</a>"
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>
