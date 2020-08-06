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
<card id="card1" title="查看图片">
<% 
Server.ScriptTimeout=999
  dim pages,objgbrs,ids,id
  id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  ids=Session("useid")
  pages=request("pages")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & ids & " and Cstr(id)=" & id
  objgbrs.open ssql,conn
 response.write "<p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/><br/>"

End if
Response.write "<img src='" & objgbrs("xclink") & "' alt='图片'/><br/><a href='" & objgbrs("xclink") & "'>下载图片</a>"
Response.write "<br/>相片标题:" & converttowide(objgbrs("niayo"))
Response.write "<br/>添加时间:" & objgbrs("times")
Response.write "<br/>----------"
response.write "<br/><a href='myzd.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|设为形象</a>"
response.write "<br/><a href='reedtp.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|修改图片</a>"
response.write "<br/><a href='zfmytp.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|转发图片</a>"
response.write "<br/><a href='del.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|删除该图</a>"
if objgbrs("bz")="0" then
Response.write "<br/><a href='album.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|设为相册</a>"
 Else
Response.write "<br/><a href='albums.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|取消相册</a>"
End if
response.write "<br/><a href='bbs.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|发到论坛</a>"
Response.write "<br/>----------<br/><a href='mybook.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回我的书包</a>"
response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



