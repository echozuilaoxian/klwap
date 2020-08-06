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
<card id="card1" title="我的好友"><p>在线好友<br/>----------<br/>
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
lasttlls="42"
lasttls
  dim page,objgbrs,ids
  ids=Session("useid")
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where Cstr(ids)=" & ids & " and Left(friid,1)<>'*' order by friid"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "你暂时还没好友.快去寻找吧.<br/>"
  else
objgbrs.PageSize=50
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if

Response.write "所有好友(<a href='myfriendd.asp?SessionID=" & SessionID & "'>" & objgbrs.RecordCount & "</a>)位<br/>"
if pages=1 then
else
bihao=pages*50-50
End if
For k=1 to objgbrs.PageSize 
tjhm=objgbrs("friid")
Response.write""& frionline& ""
objgbrs.Movenext

if objgbrs.EOF then Exit for
 Next
End if

Function frionline()
   page=request("page")
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
   objgbrr.open ssql,conn
   if not objgbrr.eof then
      frionline="<a href='/bbs/public/fsly.asp?ids=" & objgbrs("friid") & "&amp;SessionID=" & SessionID & "'>" & converttowide(redtjname) & "(在线)</a> |<anchor>删除<go method='post' href='subcl.asp?SessionID=" & SessionID & "'><postfield name='frid' value='" & objgbrs("friid") & "'/></go></anchor><br/>"
 End if
set objgbrr=nothing
End function



Response.write "--------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfriend.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfriend.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if


Response.write "<a href='/bbs/public/find.asp?wap=" & wap & "'>查找</a> <a href='/bbs/public/ckly.asp?wap=" & wap & "'>收件箱</a><br/><a href='addfriend.asp?wap=" & wap & "'>添加</a> <a href='/bbs/friandbook/subnocl1.asp?wap=" & wap & "'>黑名单</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a>-<a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"

    objgbrs.close
	conn.close
set objgbrs=nothing
set conn=nothing
   
%>



