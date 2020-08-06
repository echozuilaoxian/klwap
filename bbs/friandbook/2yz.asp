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
  dim frid,ltlyuan
  id=request("frid")
   sql="delete from guestbook Where CStr(ids)='"&ids&"' and bz='0' and reids='0'"
  conn.Execute(sql)
  Application.Unlock
  bzz="8"
  idd="0"
  ltlyuan="不通过你的加友请求！这是系统信息,请勿回复以及转发!"
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
Response.write "<card id='card1' title='验证好友'><p>成功拒绝对方的加友请求并删除所有系统信息<br/>-------------<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>首页</a></p></card></wml>"
%>



