<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
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
dim myzuan
myzuan=trim(request("myzuan"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf,myzuan from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if myzuan>9999 then
     myzuan=Clng(myzuan)
     if myzuan>objgbrs("usejf") then
            msg="兑换状态:错误!<br/>你输入的金币数量大于你现有的金币数量！<br/>您现只有<b><u>" & objgbrs("usejf") & "</u></b>枚金币<br/>请重新输入兑换数量." 
         else
            sql="update usereg set usejf=usejf-" & myzuan & ",myzuan=myzuan+" & myzuan & "*0.0001,banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            Application.Unlock
            msg="兑换状态:成功!<br/>您的金币成功兑换社币." 
     end if
   else


            msg="兑换状态:错误!<br/>10000枚金币兑1枚社币,您输入的金币数量低于10000枚." 
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


