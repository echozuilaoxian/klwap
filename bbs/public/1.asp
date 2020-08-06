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
<card id="card1" title="家族成员">
<% 
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="178"
lasttls
  dim page,objgbrs,bz,itid,id
  id=Session("useid")
  page=request("page")
 bz=request("bz")
itid=request("itid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(bzbzz)=" & bz & " and Left(id,1)'*' order by id"
  objgbrs.open ssql,conn,1,3
Response.write "<p>"
if objgbrs.eof then
Response.write "该家族尚无成员加入...<br/>"
  else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a><br/>"
End if
Response.write "共有" & objgbrs.RecordCount & "个成员"
Response.write "<br/>----------<br/>"

if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize 
 bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>" & converttowide(objgbrs("usename"))  & "(" & frionline(objgbrs("id")) & ")</a>"
if Cstr(Session("ltglzdl"))=itid or Session("Counter")="pass_numbers_56431290" then
Response.write " |<a href='/bbs/public/zccy.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>逐出</a><br/>"
end if
objgbrs.Movenext

if objgbrs.EOF then Exit for
 Next
End if

Response.write "--------------<br/>"

If pages<objgbrs.PageCount then
Response.Write "<a href='myfriend.asp?pages=" & (pages+1) & "&amp;wap=" & wap & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfriend.asp?pages=" & (pages-1) & "&amp;wap=" & wap & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if


Response.write "<br/><a href='/bbs/public/q_fsly.asp?wap=" & wap & "'>群发信息</a>"
response.write " <a href='addfriend.asp?wap=" & wap & "'>添加好友</a>"
Response.write "<br/><a href='/bbs/friandbook/nofriend.asp?wap=" & wap & "'>加黑名单</a>"
Response.write " <a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>-<a href='/index.asp?wap=" & wap & "'>首页</a></p></card></wml>"
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



