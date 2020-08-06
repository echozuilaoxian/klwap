
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
wap=request.querystring("wap")
ids=Session("useid")
  dim frid,objgbrs,ltlyuan
  id=request("frid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
   ssql="select * from usereg where Cstr(id)='" & id & "'"
  objgbrs.open ssql,conn

  set objgbrs=nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from myfriend where Cstr(frid)='" & id & "' and Cstr(ids)='" & ids & "'"
  objgbrs.open ssql,conn
if objgbrs.eof then
  ssql="insert into myfriend(ids,frid)values("
  ssql=ssql & sqlstr(ids) & ","
  ssql=ssql & sqlstr(id) & ")"
  Application.Lock
  conn.execute ssql
  Application.Unlock
%>
ltlyuan="您的朋友<a href='/bbs/public/find1.asp?wap=<%=wap%>'>" & fanname & "ID:" & ids & "</a>：在远方给您发来一封邀请.他/她想对你说：
<a href='/bbs/room/from.asp?wap=<%=wap%>'>我要去找他/她</a>"<%
     gftz
 else
 
  objgbrs.close
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.end
 end if
 objgbrs.close
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='添加好友'><p>添加成功!!"
Response.Write "<br/>-------------<br/><a href='myfriend.asp?wap=" & wap & "'>我的好友</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a>"
Response.Write "<br/><a href='/bbs/ztlb.asp?wap=" & wap & "'>社区论坛</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
%>



