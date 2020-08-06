<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="婚姻登记"><p>
<% 
Server.ScriptTimeout=999
ids=request("ids")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids="&ids&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jief WHERE bz='f' and idss='"&iduse&"' order by id desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
response.write "别乱搞啊."
elseif ids<>objgbrs("ids") and iduse<>objgbrs("idss") then
response.write "你要干吗?造反啊?"
elseif Session("useid")=objgbrs("ids") then
response.write "如此自恋?怎么自己跟字结婚了？"
else
  sql="update jief set bz='t' Where CStr(idss)='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  sql="update jief set lasttime=now() where CStr(idss)='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  sql="update usereg set fying='" & iduse & "' where CStr(id)='" & ids & "'"
  Application.Lock
  conn.Execute(sql)
 sql="update usereg set fying='" & ids & "' where CStr(id)='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
sql="Delete FROM jief WHERE bz='f' and ids='"&iduse&"'"
  conn.Execute(sql)

response.write "恭喜。你已经接受了对方的求婚并已结婚！祝福你们！<br/><a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>返回&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
end if
response.write "</p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>