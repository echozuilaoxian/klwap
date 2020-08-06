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
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
  dim idss,ids,ltlyuan
  ids=Session("useid")
 id=request("id")
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
if objgbrs("usejf")<200 then
     response.write "<card id='card1' title='赠送社区秀'><p>你都没钱购买,怎么赠送啊?努力赚钱吧."
     response.write "<br/><a href='/bbs/skin/ccx.asp?SessionID=" & SessionID & "'>社区秀场</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

  Session("ltftzl")=ltlyuan
		Session.Timeout=10
  if reids="" or ltlyuan="" then
     response.write "<card id='card1' title='赠送社区秀'><p><br/>各项必填"
     response.write "<br/><a href='/bbs/skin/ccx.asp??SessionID=" & SessionID & "'>社区秀场</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set usejf=usejf-200 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock

  ltlyuan="(img)/bbs/skin/" & id & "(/img)赠送你一件社区秀.如果你不喜欢,可暂时放在一边.\" & Session("ltname") & "说："&ltlyuan&""  
  bzz="x"
  idd="0"
  sql="insert into guestbook(ids,reids,yxxeid,gn,wpid,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
objgbrs.close
  set objgbrs=nothing
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='赠送社区秀' ontimer='/bbs/index.asp?SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write "成功赠送社区秀,正在返回..."
  response.write "<br/><a href='/bbs/skin/ccx.asp?SessionID=" & SessionID & "'>社区秀场</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>