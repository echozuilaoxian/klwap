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
iduse=Session("useid")

   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf,myjy,fying from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<10000 then
     response.write "<card id='card1' title='孩子托管'><p>你的金币不够10000,不能将孩子寄养给托儿院.还是自己好好的照顾吧,孩子是无辜的.<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
if objgbrs("myjy")<50 then
     response.write "<card id='card1' title='孩子托管'><p>你还没有孩子<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if    
if objgbrs("fying")=0 then
     response.write "<card id='card1' title='孩子托管'><p>你还没有结婚,请不要来捣乱。<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
tjhms=objgbrs("fying")

  sql="update usereg set usejf=usejf-10000,myjy='0' where CStr(id)='" & iduse & "'"
  conn.execute sql
  Application.Unlock

  sql="update usereg set usejf=usejf-10000,myjy='0' where CStr(id)='" & tjhms & "'"
  conn.execute sql
  Application.Unlock

  response.write "<card id='card1' title='孩子托管'><p>成功托管你的孩子,以后你就自由了...<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
  conn.close
  set conn=nothing
%>



