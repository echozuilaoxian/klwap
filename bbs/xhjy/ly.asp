<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect"/BBS/UseLogin.asp?SessionID="&SessionID& ""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
dim myname
  yi=request("yi")
  lyzid=request("lyzid")
  lyfid=request("lyfid")
  lyfname=request("lyfname")
  abcyi88=request("abcyi88")
  lx=request("lx")



    

if Session("ltftzl")=abcyi88 then
     response.write "<card id='bbs' title='家园留言'><p>错误,不能在短时间发内容大部分相同的留言!<br/><a href='homely.asp?id=" &lyzid & "amp;SessionID="&SessionID&"'>返回</a></p></card></wml>"
     response.end
    End if
        Session("ltftzl")=abcyi88
		Session.Timeout=30

if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
response.write "<card id='bbs' title='回复文章'><p>"
  Response.write "对不起，您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if


  sql="insert into jyly(lyzid,lyfid,lyfname,lylx,lynr)values("
  sql=sql & sqlstr(lyzid) & ","
  sql=sql & sqlstr(lyfid) & ","
  sql=sql & sqlstr(lyfname) & ","
  sql=sql & sqlstr(lx) & ","
  sql=sql & sqlstr(abcyi88) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
  sql="update jyhome set jyly=jyly+1 where jyid=" & lyzid & ""
  conn.execute sql
  Application.Unlock
  sql="update usereg set hftimes=now() where id=" & lyfid & ""
  conn.execute sql
  Application.Unlock
     response.write "<card id='bbs' title='家园留言'><p>留言成功<br/><a href='homely.asp?id=" &lyzid & "&amp;aSessionID="&SessionID&"'>返回留言列表</a><br/><a href='home.asp?id=" &lyzid & "&amp;SessionID="&SessionID&"'>返回主人家园</a></p></card></wml>"
%>