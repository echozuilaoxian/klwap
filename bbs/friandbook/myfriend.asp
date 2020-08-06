<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<card id="card1" title="我的好友"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="200"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=1"
End if
  dim page,objgbrs
  page=request("page")
useid="0"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where useid='"&useid&"' and ids='" & iduse & "' and Left(friid,1)<>'*' order by times desc"

  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "我的好友列表(默认组)<br/>-----------<br/>你还没好友.快去寻找吧.<br/>"
  else
Response.write "我的好友列表(默认组)<br/>-----------<br/>"
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages

if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize 
 bihaocont=bihaocont+1
tjhm=objgbrs("friid")
Response.write bihao+bihaocont & "." & "<a href='/bbs/public/fsly1.asp?ids=" & objgbrs("friid") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("friid") & frionline & "</a><br/>"
objgbrs.Movenext

if objgbrs.EOF then Exit for
 Next
End if

Response.write "-----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfriend.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>[&gt;&gt;]</a>"
End if
If pages>1 then
Response.Write "" & "<a href='myfriend.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID& "'>[&lt;&lt;]</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
If pages<objgbrs.PageCount or pages>1 then
Response.write "-----------<br/>"
End if
Response.write "<a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>分组管理</a>-该组群发<br/>"
Response.write "<a href='mysz.asp?SessionID=" & SessionID& "'>好友设置</a>-<a href='addfriend.asp?SessionID=" & SessionID & "'>添加好友</a><br/>"
Response.write "<a href='/bbs/friandbook/nofriend.asp?SessionID=" & SessionID & "'>黑名列表</a>-<a href='/bbs/public/find.asp?SessionID=" & SessionID & "'>查找好友</a><br/>"
Response.write "<a href='/bbs/friandbook/subfriend.asp?SessionID=" & SessionID & "'>删除好友</a>-<a href='/bbs/index.asp?SessionID=" &SessionID& "'>社区首页</a><br/>"
Response.write "注：默认组不可群发信息!</p></card></wml>"
    objgbrs.close
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="(在线)"
else
  frionline="(离线)"
  end if
  set objgbrr=nothing
End function
%>