<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  dim idss,ids,ltlyuan
  ids=Session("useid")
  reids=request("reids")
  ltlyuan=request("ltlyuan")
  reids=left(reids,30)
  reids=trim(reids)
  ltlyuan=trim(ltlyuan)
  btzz=Session("ltname")
 reids=untowide(reids)
  ltlyuan=untowide(ltlyuan)
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<0 then
     response.write "<card id='card1' title='邀请好友'><p>你负资产拉,请不动好友,努力赚钱吧."
Response.write "<br/><a href='/bbs/friandbook/myfriendroom.asp?SessionID=" & SessionID & "'>继续邀请</a>"
Response.write"<br/><a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>返回聊室</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区</a></p></card></wml>"
     response.end
    End if

  Session("ltftzl")=biao
		Session.Timeout=10
  if reids="" or ltlyuan="" then
     response.write "<card id='card1' title='邀请好友'><p><br/>出错了,各项必填.."
Response.write "<br/><a href='/bbs/friandbook/myfriendroom.asp?SessionID=" & SessionID & "'>继续邀请</a>"
Response.write"<br/><a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>返回聊室</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set usejf=usejf-0 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock
  idd="0"
  bzz="l"
  ltlyuan="你的好友邀请你去聊天,快去侃侃吧.如果你不想去,可不必理会.\" & Session("ltname") & "说：" & ltlyuan & ""  
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='邀请好友'><p align='left'>"
  response.write "成功邀请你的好友..."
Response.write "<br/><a href='/bbs/friandbook/myfriendroom.asp?SessionID=" & SessionID & "'>继续邀请</a>"
Response.write"<br/><a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>进入聊室</a>"
  response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>



