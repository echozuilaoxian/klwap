<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="网友相册">
<p align="left"><img src='/bbs/logo/xxlogo.gif' alt='网友相册'/><br/>
<% If Time < #08:00:00# And Time >= #04:00:00# Then %>
      早上好:
<% ElseIf Time < #11:30:00# And Time >= #08:00:00# Then %>
      上午好:
<% ElseIf Time < #12:30:00# And Time >= #11:30:00# Then %>
      中午好:
<% ElseIf Time < #18:00:00# And Time >= #12:30:00# Then %>
      下午好:
<% ElseIf Time < #23:00:00# And Time >= #18:00:00# Then %>
      晚上好:
<% Else %>
      午夜好:
<% End If %>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
gfdsa=Session("ltname")
if Session("zh")="wap" then
Response.write "<a href='/bbs/Reg/ltdl.asp'>游客</a>"
else
Response.write "<a href='/bbs/Reg/Useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'>"& converttowide(gfdsa)&"</a>"
end if
 
response.write "<br/><a href='xcsm.asp?SessionID=" & SessionID & "'>如何添加相片</a><br/><a href='myalbum1.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>进入我的相册>></a><br/><a href='mybook.asp?SessionID=" & SessionID & "'>进入我的书包>></a><br/><a href='tjtp.asp?SessionID=" & SessionID & "'>我要添加</a> <a href='/bbs/wapcs/wap2.asp?SessionID=" & SessionID & "'>我要上传</a><br/>=推荐相册=<br/>"
  dim objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select top 3 * from myalbum where bz='1' and biaozi='d' order by times desc"
  objgbrs.open ssql,conn,3,3
if objgbrs.eof then
   Response.write "暂时没有推荐相片<br/>"
  else
For k=1 to objgbrs.PageSize                                         
Response.write "<a href='/bbs/myalbum/myalbum.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs("xclink") & "' width='35' height='40' alt='相'/></a>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
objgbrs.close
	set objgbrs=nothing

Response.write "<br/>=最新相册="
  dim objgbrs1
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
 ssql="select top 3 * from myalbum where bz='1' order by times desc"
  objgbrs1.open ssql,conn,3,3
if objgbrs1.eof then
   Response.write "<br/>暂时没有新上传相片<br/>"
  else

For k=1 to objgbrs1.PageSize
Response.write "<br/><a href='/bbs/myalbum/myalbum.asp?id=" & objgbrs1("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs1("xclink") & "' width='35' height='40' alt='相'/></a>"
objgbrs1.Movenext
if objgbrs1.EOF then Exit for
 Next
End if
objgbrs1.close
	set objgbrs1=nothing
Response.write "<br/><a href='new.asp?SessionID=" & SessionID & "'>更多新相片...</a><br/>=热门相册="
  dim objgbrs2
  set objgbrs2=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select top 3 * from myalbum where bz='1' order by re+click desc"
  objgbrs2.open ssql,conn,3,3
if objgbrs2.eof then
   Response.write "<br/>暂时没有热门相片<br/>"
  else

For k=1 to objgbrs2.PageSize
Response.write "<br/><a href='myalbum.asp?id=" & objgbrs2("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs2("xclink") & "' width='35' height='40' alt='相'/></a>"
objgbrs2.Movenext
if objgbrs2.EOF then Exit for
 Next
End if
objgbrs2.close
	set objgbrs2=nothing
Response.write "<br/><a href='hui.asp?SessionID=" & SessionID & "'>更多热门...</a>"
%> 
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>首页</a><br/>
时间:<%=time()%></p></card></wml>
<%conn.close
	Set conn = Nothing%>
