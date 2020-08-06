<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<%
hotid=request("hotid")
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid="&hotid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
%>
<card id="hotpk" title="唇枪舌剑-唤醒好友"  ontimer='index1.asp?SessionID=<%=SessionID%>&amp;hotid=<%=hotid%>'><timer value='20'/><p>
<%
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & hotid & "'"
       rs8.open ssql,conn,1,1
if rs8.eof then
Call Error("错误,该号不存在")
end if
if rs8("ids")=iduse then
  Call Error("错误,自己不能唤醒自己")
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid=" & hotid & "&amp;"
End if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where id=" & iduse & ""
objgbrs.open ssql,conn,1,1
if objgbrs.eof then
  Call Error("错误,非法会员")
end if
if objgbrs("usejf")<5000 then
  Call Error("唤醒好友需要5000金币，你的金币不够！")
end if
conn.Execute("update scsj set hue='360',huee='n'  where ids="& hotid)

Response.write "你花费了5000金币把"&rs8("name")&"唤醒了<br/>-----------<br/>正在返回……"
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/wlwll.asp"-->
</p></card></wml>


