﻿<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<card id="card1" title="我的书包"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="43"
lasttls
  dim page,objgbrs,ids
  ids=Session("useid")
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & ids & " order by times desc"
  objgbrs.open ssql,conn,3,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "8=8"
End if
if objgbrs.eof then
    response.write "你暂时没有收藏或者没有上传,快去上传或者到论坛的图铃贴收藏资源吧。<br/>"
  else
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
Response.write "你有" & objgbrs.RecordCount & "张图片<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
if objgbrs("bz")="1" then
bz="[相册]"
else
bz=""
End if
Response.write bihao+bihaocont & "." & "<a href='view.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" &  bz & converttowide(objgbrs("niayo")) & "</a><br/>"
Response.write "<img src='" & objgbrs("xclink") & "' width='25' height='22' alt='图片'/><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='mybook.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='mybook.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
response.write "功能>"
response.write "<a href='tjtp.asp?SessionID=" & SessionID & "'>添加</a>><a href='/bbs/wapcs/wap2.asp?SessionID=" & SessionID & "'>上传</a>><a href='submarkall.asp?SessionID=" & SessionID & "'>删除</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>首页</a><br/>注:图片限制60张,可以到论坛收藏</p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



