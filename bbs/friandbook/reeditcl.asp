﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=Session("useid")
dim markname,marklink,id
  id=request("id")
  markname=request("markname")
  marklink=request("marklink")
 if markname="" or marklink="" then
     Response.write "<card id='card1' title='修改书签'><p>"
     Response.Write "地址或标题不能为空！"
     Response.Write "<br/><a href='reedit.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    Response.end
 end if
  markname=untowides(markname)
  marklink=untowides(marklink)
  ssql="update my_mark_book set baoti='" & markname & "',link='" & marklink & "' Where CStr(id)='" & id & "' and Cstr(ids)='" & ids & "'"
  conn.execute ssql
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
Function untowides(str)
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"&","&amp;")
	str=replace(str,"$","")
	str=replace(str,"","")
untowides=str
end function
%>
<card id="card1" title="修改书签" ontimer='/bbs/friandbook/viewmark.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>'>
<timer value="5"/>
<p>
修改成功，正在返回...
<br/>------------<br/><a href='mybookmark.asp?SessionID=<%=SessionID%>'>我的书签</a>
<br/><a href='/bbs/index.asp.asp?SessionID=<%=SessionID%>'>社区首页</a></p></card></wml>



