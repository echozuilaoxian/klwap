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
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<0 then
     response.write "<card id='card1' title='社区医院'><p>你是负资产,无法进入.宝宝就要出生拉,赶快想想办法"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

  Session("ltftzl")=ltlyuan
		Session.Timeout=10
  if reids="" or ltlyuan="" then
     response.write "<card id='card1' title='社区医院'><p><br/>请输入ID和想说的话."
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set usejf=usejf-0,myjy=myjy+100,myfq=myfq-15 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock
  idd="0"
  bzz="8"
  ltlyuan="你老公已经在医院办理手续.并陪在你的身边,请放心.他还说：" & ltlyuan & ""  
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  response.write "<card id='card1' title='社区医院'><p align='left'>"
  response.write "已经发送你的话语."
Response.write "<br/><a href='/bbs/reg/dongf/bbcs1.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>进入为你的孩子取上名字</a>"
  response.write "<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>



