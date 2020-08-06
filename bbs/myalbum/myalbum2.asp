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
<card id="card1" title="查看相册">
<% 
Server.ScriptTimeout=999
  dim pages,objgbrs,ids,id,re
  id=request("id")
re=request("re")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  ids=Session("useid")
  pages=request("pages")
Session("returnuppath")=""
gfdsa=Session("ltname")
  sql="update myalbum set click=click+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where id=" & id & " and bz='1'"
  objgbrs.open ssql,conn
 response.write "<p>"
Response.write "你好:" & converttowide(gfdsa)
Response.write "<br/><img src='" & objgbrs("xclink") & "' alt='相片'/><br/>"
Response.write "介绍:" & converttowide(objgbrs("niayo"))
Response.write "<br/>评><a href='mei.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>靓</a>" & objgbrs("mei") & "票"
Response.write "><a href='ping.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>平</a>" & objgbrs("ping") & "票"
Response.write "><a href='cha.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>差</a>" & objgbrs("cha") & "票"
Response.write "<br/>功能>"
Response.write "<a href='" & objgbrs("xclink") & "'>下载</a>"
Response.write "><a href='myalbum.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>120*110</a>"
Response.write "><a href='myalbum3.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>大图</a><br/>"%>
<anchor>收藏到我的书包
<go method="post" href='/bbs/myalbum/addbook.asp?SessionID=<%=SessionID%>'><%
response.write "<postfield name='xcname' value='相册收藏图片'/><postfield name='xclink' value='" & objgbrs("xclink") & "'/>"%>
</go>
</anchor><%
response.write "<br/><img src='/bbs/logo/lyxx.gif' alt='.'/>"
response.write "<a href=""re.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & """>留言("& objgbrs("re")&"条)</a><br/>"
	response.write "<img src='/bbs/logo/lyx.gif' alt='.'/>"
	response.write "<a href=""re.asp?action=post&amp;id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & """>发表留言</a>"
Response.write "<br/><a href='myalbum1.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>查看更多>></a>"
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>相册主人ID:" & objgbrs("ids") & "资料>></a>"
Response.write "<br/><input name='ltlyuan' maxlength='200'/>"
Response.write "<br/><anchor>发信交友"
Response.write "<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'>"
Response.write "<postfield name='ltlyuan' value='$(ltlyuan)\系统提示:此信息是发信人在看了你的相片后发的[发信交友]信息'/>"
Response.write "<postfield name='ids' value='" & objgbrs("ids") & "'/>"
Response.write "</go></anchor>"
Response.write "<br/>访问次数:" & objgbrs("click")
Response.write "<br/>----------<br/>"

response.write "<a href='index.asp?SessionID=" & SessionID & "'>相册</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



