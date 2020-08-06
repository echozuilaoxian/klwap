<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
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
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
  dim show,objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 10 * from gproom where baoch='1' order by id desc"
  objgbrs.open ssql,conn,1,3
Response.write "<card id='card1' title='查看股票消息'><p>"
if objgbrs.eof then
   Response.write "暂时没有股民发布股市消息<br/>"
else
 Do while not objgbrs.eof

     Response.write "" & converttowide(objgbrs("usename")) & "放出消息:"
Response.write converttowide(objgbrs("talk")) & "<br/>时间:" & objgbrs("date") & "<br/>"
objgbrs.Movenext
Loop
end if

	conn.close
	set objgbrs=nothing
	Set conn = Nothing

Response.Write "<br/><a href='/bbs/gp/index.asp?SessionID=" & SessionID & "'>社区股市</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
%>



