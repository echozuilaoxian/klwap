<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<% 
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
   Response.write "<card id='card1' title='黑名单' ontimer='nofriend.asp?SessionID=" & SessionID & "'><timer value='1'/><p>"
   response.write "进入黑名单,无回应请"
   response.write "<a href='nofriend.asp?SessionID=" & SessionID & "'>点击这里</a>进入...</p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.end
end if
 objgbrs.close
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='黑名单' ontimer='nofriend.asp?SessionID=" & SessionID & "'><timer value='1'/><p>"
response.write "进入黑名单,无回应请"
Response.Write "<a href='nofriend.asp?SessionID=" & SessionID & "'>点击这里</a>进入..."
Response.Write "<br/>------------"
Response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>



