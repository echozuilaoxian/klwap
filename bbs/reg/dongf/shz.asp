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
    sqls="select usejf from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sqls,conn
if objgbrs("usejf")<99 then
     response.write "<card id='card1' title='妇产科'><p>你的金币不够99,赶快去借些.宝宝就要出生拉。<br/>------------<br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

  Session("ltftzl")=biao
		Session.Timeout=10
  if reids="" or ltlyuan="" then
     response.write "<card id='card1' title='妇产科'><p><br/>请邀请宝宝的父母一起到现场.<br/>------------<br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set usejf=usejf-99,myjy=myjy+100,myfq=myfq-15 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock
  idd="0"
  bzz="yy"
  ltlyuan="你的另一半,就要生宝宝了.请赶快到医院办理手续.你的另一半还在妇产科等你呢.\" & Session("ltname") & "说：" & ltlyuan & ""  
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  response.write "<card id='card1' title='妇产科'><p align='left'>已经发了火速令给你的另一半了,正在进入生产间<br/><a href='/bbs/reg/dongf/bbcs.asp?id=" & ids & "&amp;SessionID=" &SessionID & "'>进入生产间</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"

objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>



