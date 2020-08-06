<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
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
  dim frid,objgbrs
  frid=request("frid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from myfriend where Cstr(ids)='" & id & "' and Cstr(friid)='*" & frid & "'"
  objgbrs.open ssql,conn
if not objgbrs.eof then
  set objgbrs=nothing
  sql="delete from myfriend Where Cstr(ids)='" & id & "' and Cstr(friid)='*" & frid & "'"
  Application.lock
  conn.execute sql
  Application.Unlock
   Response.write "<card id='card1' title='删除黑名单' ontimer='nofriend.asp?SessionID=" & SessionID & "'><timer value='10'/><p>"
   response.write "删除成功,正在返回..."
   response.write "<br/><a href='nofriend.asp?SessionID=" & SessionID & "'>我的黑名单</a></p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.end
end if
 objgbrs.close
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='删除黑名单'><p>"
Response.Write "此黑名单已删除！"
Response.Write "<br/>------------"%><%
Response.Write "<br/><a href='nofriend.asp?SessionID=" & SessionID & "'>我的黑名</a>"
Response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>



