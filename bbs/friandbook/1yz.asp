<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
ids=Session("useid")
  dim frid,ltlyuan,objgbrs
  id=request("frid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from myfriend where Cstr(ids)='" & id & "' and Cstr(friid)='" & ids & "'"
  objgbrs.open ssql,conn
if objgbrs.eof then
  ssql="insert into myfriend(ids,friid)values("
  ssql=ssql & sqlstr(id) & ","
  ssql=ssql & sqlstr(ids) & ")"
  Application.Lock
  conn.execute ssql
  Application.Unlock


  bzz="8"
  idd="0"
  ltlyuan="通过你的交友请求！这是系统信息,请勿回复以及转发!"
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
 else
   Response.write "<card id='card1' title='验证好友'><p>该号已经验证过了,请不要重复。<br/><a href='myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" &SessionID & "'>首页</a></p></card></wml>"
  response.end
 end if
 objgbrs.close
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='验证好友'><p>成功通过验证!你已经在对方的好友列表里面了<br/><a href='addcl.asp?frid=" & id & "&amp;SessionID=" & SessionID & "'>加对方为好友</a><br/>-------------<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID& "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>首页</a></p></card></wml>"
%>



