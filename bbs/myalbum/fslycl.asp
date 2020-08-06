<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
dim ltlyuan,ids,reids
reids=Session("useid")
wap=request.querystring("wap")
 ltlyuan=request("ltlyuan")
 ids=request("ids")
ltlyuan=trim(ltlyuan)
ltlyuan=untowide(ltlyuan)
  if ltlyuan="" then
     response.write "<card id='card1' title='发送信息'><p align='left'><br/>字段不能为空白！！"
     response.write "<br/><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;wap=" & wap & "'>[返回重写]</a>"
     response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>[社区首页]</a><br/><a href='/index.asp?wap=" & wap & "'>[狂野首页]</a></p></card></wml>"
     response.end
  End if
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
 response.write "<card id='card1' title='发送信息'><p align='left'>"
  Response.write "对不起!您的发信权已被锁，请与管理员联系!</p></card></wml>"
  response.end
  End if
if conn.execute("select * from myfriend where ids='"& ids &"' and friid='*" & reids & "'").eof then
  sql="insert into myalbum(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock

end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='发送信息'><p>"
  response.write"发送成功!!<br/><a href='/bbs/public/ckly.asp?wap=" & wap & "'>[回收件箱]</a>"
 response.write"<br/><a href='/bbs/public/srxx.asp?wap=" & wap & "'>[私人信箱]</a>"

if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "?wap=" & wap & "'>[刚才页面]</a>"
  Else
End if
 
Response.write "<br/><a href='/bbst/friandbook/myfriend.asp?wap=" & wap & "'>[我的好友]</a>"
  response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>[我的地盘]</a>"
  response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>[社区首页]</a><br/><a href='/index.asp?wap=" & wap & "'>[狂野首页]</a>"%>
<br/>时间:<%=time%>
<%

Response.write "</p></card></wml>"


function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>