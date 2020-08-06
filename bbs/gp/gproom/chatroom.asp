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
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
  dim show,objgbrs
  show=request("show")
  if show="" then
     show=0
  end if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 15 * from gproom where baoch='2' order by id desc"
  objgbrs.open ssql,conn,1,3
Response.write "<card id='card1' title='股票交流' ontimer='/bbs/gp/gproom/chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'><timer value='200'/><p>"
%>
<do type="accept" label="发言">
   <go href='talk.asp?show=<% =show %>&amp;SessionID=<%=SessionID%>'>
   </go>
</do>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息！</a><br/>"
    Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show & ""
End if
    Response.write "<a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    RecordCounts=RecordCount
    response.write "|<a href='/bbs/reg/ckzxhyany.asp?lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线(" & RecordCounts & ")</a>"
    Response.write "<br/>----------<br/>"
if objgbrs.eof then
   Response.write "欢迎进入股票交流室！<br/>"
else
 Do while not objgbrs.eof
   if objgbrs("forname")="大家" then
     Response.write "" & converttowide(objgbrs("usename")) & ":"
    else
     Response.write "" & converttowidebaiti(objgbrs("usename")) & "-对>" & converttowidebaiti(objgbrs("forname")) & "说:"
   end if
Response.write converttowide(UBBCodes(objgbrs("talk"))) & "(" & objgbrs("times") & ")<br/>"
objgbrs.Movenext
Loop
end if
set objgbrs=nothing
sql="Delete FROM gproom WHERE baoch='2' and DATEDIFF('s', date, now()) > 60*60"
conn.Execute sql
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
Response.write "----------<br/>"
    Response.write "<a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    response.write "|<a href='/bbs/reg/ckzxhyany.asp?lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线(" & RecordCounts & ")</a>"
Response.Write "<br/><a href='/bbs/gp/index.asp?SessionID=" & SessionID & "'>社区股市</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>首页</a></p></card></wml>"

function chUBBCodes(memo)
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(图=([0-9]*))(.*)"
 if show=1 then
        memo=re.Replace(memo,"$1<img src=""img/$3.gif"" alt=""load...""/>$4")
    else
        memo=re.Replace(memo,"$1$4")
 end if
	chUBBCodes=memo
end function
%>



