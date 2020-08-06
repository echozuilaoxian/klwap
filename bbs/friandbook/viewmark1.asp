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
<card id="card1" title="查看日记">
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
  dim pages,objgbrs,ids,id
  id=request("id")
  ids=Session("useid")
  pages=request("pages")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from my_mark1_book where Cstr(ids)=" & ids & " and Cstr(id)=" & id
  objgbrs.open ssql,conn
 response.write "<p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>----------<br/>"
End if
Response.write "标题:" & converttowide(objgbrs("baoti"))
Response.write "<br/>内容:" & objgbrs("link") & " "
Response.write "<br/>----------<br/>"
response.write "<a href='reedit1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>修改日记</a>"
response.write "<br/><a href='delmark1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>删除这条</a>"
Response.write "<br/>----------"
Response.write "<br/><a href='mybookmark1.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回私人日记</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



