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
<card id="card1" title="我的黑名单">
<% 
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
  ssql="select * from myfriend where Cstr(ids)=" & ids & " and Left(friid,1)='*' order by friid"
  objgbrs.open ssql,conn,1,3
Response.write "<p>"
if objgbrs.eof then

    response.write "暂时没有黑名单记录<br/>"
  else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
End if
Response.write "共有" & objgbrs.RecordCount & "个黑名单"
Response.write "<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("friid")
tjhm=replace(tjhm,"*","")
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & tjhm & "&amp;SessionID=" & SessionID & "'>" & converttowide(redtjname) & "ID:" & tjhm & frionline & "</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfriend.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfriend.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
response.write "<a href='addnofriend.asp?SessionID=" & SessionID & "'>添加黑名</a> <a href='subnofriend.asp?SessionID=" & SessionID & "'>删除黑名</a>"
Response.write "<br/><a href='/bbs/public/find.asp?SessionID=" & SessionID & "'>查找会员</a> <a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>网站首页</a>"
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
  frionline="&#40;&#22312;&#32447;&#41;"
  end if
  objgbrr.close
  set objgbrr=nothing
End function
%>



