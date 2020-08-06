<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
id=Session("useid")
dim n
 n=request("n")
 n=Clng(n)
if n="" or  n>2 then
     response.write "<card id='card1' title='好友设置'><p align='left'>"
     response.write "所选选项错误！<br/><a href='mysz.asp?SessionID=" & SessionID & "'>返回重选</a></p></card></wml>"
     response.end
  End if
  sql="update usereg set byid='" & n & "' Where CStr(id)='" & id & "'"
 Application.Lock
            conn.execute(sql)
Application.Unlock
set objgbrs=nothing
conn.close
set conn=nothing
  response.write "<card id='card1' title='好友设置' ontimer='/bbs/friandbook/mysz.asp?SessionID=" & SessionID & "'><timer value='10'/><p>设置成功！正在返回...<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>回我的好友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>回社区首页</a></p></card></wml>"
%>



