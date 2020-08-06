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
<card id="card1" title="邀请好友">
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
  dim page,objgbrs,ids
  ids=Session("useid")
  page=request("page")

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where Cstr(ids)=" & ids & " and Left(friid,1)<>'*' order by friid"

  objgbrs.open ssql,conn,1,3

Response.write "<p>"
if objgbrs.eof then
Response.write "你暂时还没好友.快去寻找吧.<br/>"
  else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?8=0"
End if
Response.write "共有" & objgbrs.RecordCount & "个好友"
Response.write "<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize 
 bihaocont=bihaocont+1
tjhm=objgbrs("friid")
Response.write bihao+bihaocont & "."
Response.write "" & converttowide(redtjname) & "ID:" & objgbrs("friid") & frionline
Response.write "|<anchor>邀请<go method='post' href='/bbs/public/fslycl1.asp?SessionID=" & SessionID & "'><postfield name='ltlyuan' value='快来聊聊,不要让我久等了.'/><postfield name='ids' value='" & objgbrs("friid") &"'/></go></anchor><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if

Response.write "--------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfriendroom.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfriendroom.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if

response.write "好友ID:<br/><input type='text' name='reids' format='*N'/><br/>要说说什么吗：<br/><input type='text' name='ltlyuan' value='来聊天室聊天'/><br/><anchor>马上邀请<go method='post' href='/bbs/friandbook/zscl.asp?SessionID=" & SessionID & "'><postfield name='reids' value='$(reids)'/><postfield name='ltlyuan' value='$(ltlyuan)'/></go></anchor><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
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



