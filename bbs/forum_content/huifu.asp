<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<%
Server.ScriptTimeout=999
itid=request("itid")
if Session("ltglzdl")<>"" then
  dim id,page
  page=request("page")
  id=Request("id")
  sql="update wuza set san='f' Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
response.write "<card id='card1' title='文章恢复成功!!' ontimer='zcwwcl.asp?itid=" & itid & "&ampid=" & objgbrs("id") & "&amppage=" & page & "'><timer value='10'/><p align='center'>"
  response.write "文章恢复成功，正在返回...<br/><a href='zcww.asp?itid=" & itid & "'>文章列表</a></p></card></wml>"
objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
End if
%>



