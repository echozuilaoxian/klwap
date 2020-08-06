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
<card id="card1" title="查看收藏">
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
  dim pages,objgbrs,ids,id
  id=request("id")
  ids=Session("useid")
  pages=request("pages")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from my_mark_book where Cstr(ids)=" & ids & " and Cstr(id)=" & id
  objgbrs.open ssql,conn
 response.write "<p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>----------<br/>"
End if
Response.write "标题:" & converttowide(objgbrs("baoti"))
Response.write "<br/><a href='" & objgbrs("link") & "SessionID=" & SessionID & "'>访问>></a><br/>"
Response.write "----------<br/>"
response.write "<a href='reedit.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>修改收藏</a>"
response.write "<br/><a href='delmark.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>删除这条</a>"
Response.write "<br/>----------<br/>"
Response.write "<a href='mybookmark.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回我的收藏</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



