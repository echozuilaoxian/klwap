﻿<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
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
wap=request.querystring("wap")
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
Response.write "你好:" & converttowide(gfdsa)&"<br/></p><do type = "accept" label = "返回"><go href=""></go></do><p><img src='" & objgbrs("xclink") & "' alt='相片'/><br/>介绍:" & converttowide(objgbrs("niayo"))&"<br/>评:<a href='mei.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>[爽歪歪!" & objgbrs("mei") & "票]</a><br/>评:<a href='ping.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>[一般般!" & objgbrs("ping") & "票]</a><br/>评:<a href='cha.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>[很差劲!" & objgbrs("cha") & "票]</a><br/><a href='" & objgbrs("xclink") & "'>免费下载</a>|<a href='myalbum2.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>原图</a>|<a href='myalbum3.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>大图</a><br/><anchor>收藏到我的书包<go method='post' href='/bbs/myalbum/addbook.asp?wap=" & wap & "'><postfield name='xcname' value='相册收藏图片'/><postfield name='xclink' value='" & objgbrs("xclink") & "'/></go></anchor><br/><img src='/bbs/logo/lyxx.gif' alt='.'/><a href=""re.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & """>留言("& objgbrs("re")&"条)</a><br/><img src='/bbs/logo/lyx.gif' alt='.'/><a href=""re.asp?action=post&amp;id=" & objgbrs("id") & "&amp;wap=" & wap & """>发表留言</a><br/><a href='myalbum1.asp?id=" & objgbrs("ids") & "&amp;wap=" & wap & "'>查看Ta更多相片</a>"
tjhm=objgbrs("ids")
Response.write "<br/>相册主人:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;wap=" & wap & "'>" & converttowide(redtjname) & "ID:" & objgbrs("ids") & "</a><br/><input name='ltlyuan' maxlength='200'/><br/><anchor>发信交友<go method='post' href='/bbs/public/fslycl.asp?wap=" & wap & "'><postfield name='ltlyuan' value='$(ltlyuan)\系统提示:此信息是发信人在看了你的相片后发的[发信交友]信息'/><postfield name='ids' value='" & objgbrs("ids") & "'/></go></anchor><br/>访问次数:" & objgbrs("click")
if CStr(objgbrs("ids"))=CStr(Session("useid")) then
if objgbrs("biaozi")="t" then
response.write "<br/><a href='wtj.asp?id=" & objgbrs("id") & "&amp;tj=d&amp;wap=" & wap & "'>[自我推荐]</a>"
    End if
if objgbrs("biaozi")="d" then
response.write "<br/><a href='wtj.asp?id=" & objgbrs("id") & "&amp;tj=t&amp;wap=" & wap & "'>[撤消推荐]</a>"
    End if
end if
if Session("Counter")="pass_numbers_56431290" then
if objgbrs("biaozi")="t" or objgbrs("biaozi")="d" then
response.write "<br/><a href='tj.asp?id=" & objgbrs("id") & "&amp;tj=f&amp;wap=" & wap & "'>[推荐此相片]</a>"
    End if
if objgbrs("biaozi")="f" then
response.write "<br/><a href='tj.asp?id=" & objgbrs("id") & "&amp;tj=t&amp;wap=" & wap & "'>[撤消推荐]</a>"
    End if
response.write "<br/><a href='dels.asp?id=" & objgbrs("id") & "&amp;ids=" & objgbrs("ids") & "&amp;wap=" & wap & "'>[删除此相片]</a>"
end if
Response.write "<br/>----------<br/>"

response.write "<a href='index.asp?wap=" & wap & "'>[网友相册]</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>[我的地盘]</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>[社区首页]</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



