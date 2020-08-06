<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="兑换魅力"><p>
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
dim outml
outml=trim(request("outml"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select roomjfjf,ml from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if outml>99 then
     outml=Clng(outml)
     if outml>objgbrs("roomjfjf") then
            msg="你的积分没有那么多，请重新兑换。" 
         else
            sql="update usereg set roomjfjf=roomjfjf-" & outml & ",ml=ml+" & outml & "*0.01,banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            Application.Unlock
            msg="成功兑换." 
     end if
   else


            msg="积分兑魅力最少兑换100分。" 
 end if

    response.write msg
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<br/><anchor>返回上级<prev/></anchor>
<%
response.Write "<br/><a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>返回积分兑换</a>"
response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>





