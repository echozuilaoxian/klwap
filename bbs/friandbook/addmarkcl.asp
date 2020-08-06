<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
id=Session("useid")
dim markname
dim marklink
  markname=request("markname")
  marklink=trim(request("marklink"))
  markname=untowides(markname)
  marklink=untowides(marklink)
  if marklink="" then
     marklink = Session("returnuppath")
  end if
 if markname="" or marklink="" then
     Response.write "<card id='card1' title='我的收藏'><p>"
     Response.Write "名称或地址不能为空"
     Response.Write "<br/><a href='addmark.asp?SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    Response.end
 end if
  ssql="insert into my_mark_book(ids,baoti,link)values("
  ssql=ssql & sqlstr(id) & ","
  ssql=ssql & sqlstr(markname) & ","
  ssql=ssql & sqlstr(marklink) & ")"
  conn.execute ssql
  Application.Unlock
  conn.close
  set conn=nothing
Response.write "<card id='card1' title='我的收藏' ontimer='mybookmark.asp?SessionID=" & SessionID & "'><timer value='5'/><p>"
Response.Write "成功收藏，正在返回..."
Response.Write "<br/>------------<br/><a href='mybookmark.asp?SessionID=" & SessionID & "'>我的收藏夹</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
Function untowides(str)
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"&","&amp;")
	str=replace(str,"$","")
        str=replace(str,"&page=","")
	str=replace(str,"","")
untowides=str
end function
%>




