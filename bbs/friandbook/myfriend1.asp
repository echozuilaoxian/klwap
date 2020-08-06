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
<card id="card1" title="我的好友"><p>好友列表<br/>-----------<br/>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="42"
lasttls
  dim page,objgbrs
  page=request("page")
useid="0"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where useid='"&useid&"' and ids='" & iduse & "' and Left(friid,1)<>'*' order by times desc"

  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "你暂时还没好友.快去寻找吧.<br/>"
  else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if

if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize 
 bihaocont=bihaocont+1
tjhm=objgbrs("friid")
Response.write bihao+bihaocont & "." & "<a href='/bbs/public/fsly1.asp?ids=" & objgbrs("friid") & "&amp;wap=" & wap & "'>" & converttowide(redtjname) & "ID:" & objgbrs("friid") & frionline & "</a>"
Response.write " |<anchor>删除<go method='post' href='subcl.asp?wap=" & wap & "'><postfield name='frid' value='" & objgbrs("friid") & "'/></go></anchor><br/>"
objgbrs.Movenext

if objgbrs.EOF then Exit for
 Next
End if

Response.write "--------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfriend1.asp?pages=" & (pages+1) & "&amp;wap=" & wap & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfriend1.asp?pages=" & (pages-1) & "&amp;wap=" & wap & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
Response.write "<a href='/bbs/public/find.asp?wap=" & wap & "'>[查找好友]</a><br/><a href='/bbs/public/q_fsly100.asp?idd=0&amp;wap=" & wap & "'>[该组群发]</a><br/><a href='addfriend.asp?wap=" & wap & "'>[添加好友]</a><br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>[回我的好友]</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>[我的地盘]</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>[社区首页]</a></p></card></wml>"
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
  end if
  set objgbrr=nothing
End function
%>



