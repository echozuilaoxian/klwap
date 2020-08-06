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
 idd=request("idd")
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(id)=" & idd &" and Cstr(idd)=" & iduse
rs.open ssql1,conn
if rs.eof then
   Response.write "<card id='card1' title='好友分组'><p>ID错误<br/></p></card></wml>"
response.end
 Else
ycccc=rs("country")
End if
rs.close
set rs=nothing
Response.write "<card id='card1' title='分组-"&converttowidebaiti(ycccc)&"'><p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?idd="&idd&""
End if

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where Cstr(ids)=" & iduse & " and useid='"&idd&"' and Left(friid,1)<>'*' order by times desc"

  objgbrs.open ssql,conn,1,3

if objgbrs.eof then
Response.write ""&converttowidebaiti(ycccc)&"-该组没有添加好友，请添加.<br/>"
  else
Response.write ""&converttowidebaiti(ycccc)&"-有"&objgbrs.RecordCount&"位好友<br/>------------<br/>"
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
Response.write "------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myfzhy.asp?idd="&idd&"&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='myfzhy.asp?idd="&idd&"&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if

Response.write "<a href='/bbs/friandbook/hyfz/bbs_fzxg.asp?idd="&idd&"&amp;SessionID=" & SessionID & "'>修改该组</a>-<a href='/bbs/public/q_fsly100.asp?idd="&idd&"&amp;SessionID=" & SessionID & "'>该组群发</a><br/>"
Response.write "<a href='/bbs/friandbook/hyfz/dellyall.asp?id="&idd&"&amp;SessionID=" & SessionID& "'>删除该组</a>-<a href='/bbs/friandbook/addfriend.asp?SessionID=" & SessionID & "'>添加好友</a><br/>"
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID& "'>默认分组</a>-<a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>分组管理</a><br/>"
Response.write "<a href='/bbs/friandbook/subfriend.asp?SessionID=" & SessionID & "'>删除好友</a>-<a href='/bbs/index.asp?SessionID=" &SessionID& "'>社区首页</a></p></card></wml>"
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