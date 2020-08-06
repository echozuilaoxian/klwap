<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")%>
<%
Server.ScriptTimeout=999
dim ltlyuan,ids,reids
reids=Session("useid")
 ltlyuan=request("ltlyuan")
 ids=request("ids")
ltlyuan=trim(ltlyuan)
ltlyuan=untowide(ltlyuan)
  if ltlyuan="" then
     response.write "<card id='card1' title='发送信息'><p align='left'><br/>字段不能为空白！！"
     response.write "<br/><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
 response.write "<card id='card1' title='发送信息'><p align='left'>"
  Response.write "对不起!您的发信权已被锁，请与管理员联系!</p></card></wml>"
  response.end
  End if
  bzz="l"
if conn.execute("select * from myfriend where ids='"& reids &"' and friid='*" & ids & "'").eof then
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='发送信息' ontimer='/bbs/room/from.asp?SessionID=" & SessionID & "'><timer value='40'/><p>"
  response.write"你好。你的邀请已经发送成功!!<br/>五秒后会系统会自动带你到聊天室!!<br/><a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>聊天室</a><br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>回收件箱</a>"
 
  response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
  response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"


Response.write "</p></card></wml>"


function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>