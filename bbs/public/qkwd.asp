<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
Server.ScriptTimeout=999
   sql="update guestbook set biaozi='f' Where CStr(ids)='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook Where CStr(ids)='" & iduse &"'"
  objgbrs.open ssql,conn
Response.Write "<card id='card1' title='信息管理' ontimer='ckly.asp?SessionID=" & SessionID & "'><timer value='10'/><p>"

if CStr(objgbrs("ids"))<>CStr(Session("useid")) then
Response.end
end if
response.write "成功略去所有新信息!正在返回...<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a>"
if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>刚才页面</a>"
  Else
   Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
End if
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID& "'>社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>





