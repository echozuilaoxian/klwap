<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Cstr(Session("yxxezb"))<>"" or Session("bzbz")<>"" or Session("Counter")="pass_numbers_55556666" then
	dim id
	id=request("id")
    sql="update usereg set gly='0' where CStr(id)='" & id & "'"
    conn.execute(sql)
Response.write "<card id='card1' title='版主操作' ontimer='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='10'/>"
Response.write "<p>操作成功,正在返回..."
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>用户资料</a></p></card></wml>"
end if
conn.close
set conn=nothing
%>







