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
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if

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
    sql="select usejf from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<3000 then
     response.write "<card id='card1' title='邀请洞房'><p>你的金币不够3000,努力赚钱吧.<br/>----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

  Session("ltftzl")=biao
		Session.Timeout=10
  if reids="" or ltlyuan="" then
     response.write "<card id='card1' title='邀请洞房'><p><br/>各项必填<br/>----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set usejf=usejf-30 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock
  idd="0"
  bzz="tf"
  ltlyuan="你的另一半邀请你去洞房.如果你还不想洞房,可不必理会." & Session("ltname") & "说："& ltlyuan&""  
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
  response.write "<card id='card1' title='开房间' ontimer='/bbs/reg/dongf/loveroom/index.asp?nickname=%E6%88%BF%E5%AE%A2515&amp;act=custom&amp;SessionID="&SessionID&"'><timer value='10'/><p align='left'>成功邀请,好好在你的房间等你的另一半吧.正在进入房间...<br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a></p></card></wml>"
%>