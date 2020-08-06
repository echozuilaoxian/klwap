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
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
ids=Session("useid")
ltname=Session("ltname")
  dim frid,objgbrss,ltlyuan,objgbrs
  id=request("frid")
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
   ssql="select byid,id from usereg where Cstr(id)='" & id & "'"
  objgbrss.open ssql,conn
if objgbrss.eof then
  Response.write "<card id='card1' title='添加好友' ontimer='addfriend.asp?SessionID=" & SessionID & "'><timer value='10'/><p>该号还没注册...<br/><a href='addfriend.asp?SessionID=" & SessionID & "'>[返回重写]</a></p></card></wml>"
  response.end
 else
  fanname=Session("ltname")
End if
if objgbrss("byid")=1 then
  bzz="y"
  idd="0"
  ltlyuan="请求加你为好友!\这是系统信息,请勿回复以及转发!"
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
Response.write "<card id='card1' title='添加好友'><p>对方的[好友设置]为需要验证后才能被加为好友，已经发送你的交友信息，请等待对方验证。<br/><a href='myfriend.asp?SessionID=" & SessionID & "'>[我的好友]</a><br/><a href='index.asp?SessionID=" & SessionID & "'>[社区首页]</a></p></card></wml>"
  response.end
end if
if objgbrss("byid")=2 then
Response.write "<card id='card1' title='添加好友'><p>对方不允许任何人加为好友，添加好友不成功。<br/><a href='myfriend.asp?SessionID=" &SessionID& "'>[我的好友]</a><br/><a href='index.asp?SessionID=" & SessionID & "'>[社区首页]</a></p></card></wml>"
  response.end
end if
 objgbrss.close
  set objgbrss=nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from myfriend where Cstr(friid)='" & id & "' and Cstr(ids)='" & ids & "'"
  objgbrs.open ssql,conn
if objgbrs.eof then
  ssql="insert into myfriend(ids,friid)values("
  ssql=ssql & sqlstr(ids) & ","
  ssql=ssql & sqlstr(id) & ")"
  Application.Lock
  conn.execute ssql
  Application.Unlock

  bzz="8"
  idd="0"
  ltlyuan="将您加为好友！这是系统信息,请勿回复以及转发!"
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
   Response.write "<card id='card1' title='添加好友'><p>该号已是您的好友,不要太热情嘛!!<br/><a href='addfriend.asp?SessionID=" & SessionID & "'>返回重写</a>&nbsp;<a href='myfriend.asp?SessionID=" & SessionID& "'>我的好友</a></p></card></wml>"
  response.end
 end if
 objgbrs.close
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='添加好友'><p>添加成功!!<br/>-------------<br/><a href='myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>



