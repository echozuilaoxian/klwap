<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
ids=Session("useid")
  dim frid,objgbrs,ltlyuan
  id=request("frid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
   ssql="select * from usereg where Cstr(id)='" & id & "'"
  objgbrs.open ssql,conn
if objgbrs.eof then
  Response.write "<card id='card1' title='添加黑名单' ontimer='addnofriend.asp?SessionID=" & SessionID & "'><timer value='10'/><p>"
  Response.write "该号还没注册,返回重写...<br/><a href='addfriend.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.end
 else
  fanname=Session("ltname")
End if
  set objgbrs=nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from myfriend where Cstr(friid)='*" & id & "' and Cstr(ids)='" & ids & "'"
  objgbrs.open ssql,conn
if objgbrs.eof then
  id="*" & id
  ssql="insert into myfriend(ids,friid)values("
  ssql=ssql & sqlstr(ids) & ","
  ssql=ssql & sqlstr(id) & ")"
  Application.Lock
  conn.execute ssql
  Application.Unlock
 else
   Response.write "<card id='card1' title='添加黑名单'><p>"
   response.write "该号已是您的黑名单,不是那么憎恨吧!!"
   response.write "<br/><a href='addnofriend.asp?SessionID=" & SessionID & "'>返回重写</a><br/><a href='nofriend.asp?SessionID=" & SessionID & "'>我的黑名单</a></p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.end
 end if
 conn.close
 set objgbrs=nothing
 set conn=nothing
Response.write "<card id='card1' title='添加黑名单'><p>添加成功!!该会员将无法给你发信"
Response.Write "<br/>--------------"%><%
Response.Write "<br/><a href='nofriend.asp?SessionID=" & SessionID & "'>我的黑名</a>"
Response.Write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>






