<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<% wap=request.querystring("wap") %>
<%
Server.ScriptTimeout=999
  dim timee,page,lingnam
  lingnam=request("lingname")
  page=Request("page")
  timee=Request("timee")
Response.Write "<wml><card id='card1' title='成语词典'><p>"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from pic_cy Where CStr(id)='" & timee &"'"
  objgbrs.open ssql,conn
Response.Write "词目:" & converttowide(objgbrs("biaoti"))
Response.Write "<br/>发音: " & objgbrs("sg")
Response.Write "<br/>释义:" & converttowide(objgbrs("js"))
Response.write "<br/>出处: " & converttowide(objgbrs("content"))
Response.Write "<br/>示例: " & converttowide(objgbrs("jilu"))
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

response.write "<br/>-------------"
response.write "<br/><a href='fincycl.asp?page=" & page & "&amp;lingname=" & lingnam & "&amp;wap=" & wap & "'>回上一级</a>"
Response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>-<a href='/index.asp?wap=" & wap & "'>首页</a></p></card></wml>"
%>

