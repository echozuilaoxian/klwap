<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
Server.ScriptTimeout=999
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")<>"" or Session("Counter")="pass_numbers_55556666" then
Else
   Response.write "<card id='card1' title='执行解锁' ontimer='xczu.asp?SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
   Response.write "<br/>你非管理员,闲人勿扰,正在返回…<br/><a href='/bbs/public/xczu.asp?SessionID=" & SessionID & "'>返回监狱</a></p></card></wml>"
   Response.End
End if
 	dim id,bzfscz,ids
	id=request("id")
	ids=Session("useid")
	bzfscz=CStr(request("bzfscz"))
 Select Case bzfscz
   Case "1"
    sql="update usereg set ftsdbz='f',lysdbz='f',fsczg='" & ids & "' where CStr(id)='" & id & "'"
   Case "2"
    sql="update usereg set ftsdbz='f',fsczg='" & ids & "' where CStr(id)='" & id & "'"
 End Select
    conn.execute(sql)
conn.close
set conn=nothing
Response.write "<card id='card1' title='封禁操作' ontimer='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>操作成功,正在返回...<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>会员资料</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

%>



