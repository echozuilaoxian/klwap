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
if SessionID="" then SessionID=Session("SessionID")%>
<%
Server.ScriptTimeout=999
  dim id,page,pages
  pages=request("pages")
  id=request("id")
  page=request("page")
  sql="update myalbum set bz=0 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn
Response.Write "<card id='card1' title='撤消相册'><p>"

if CStr(objgbrs("ids"))<>CStr(Session("useid")) then
Response.end
end if
response.write "取消成功!!请返回..."
response.write "<br/><a href='mybook.asp?SessionID=" & SessionID & "'>我的书包</a>"
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>





