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
<p align="left"><img src='/lt/logo/xxlogo.gif' alt='网友相册'/><br/>
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
wap=request.querystring("wap")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
gfdsa=Session("ltname")
if Session("zh")="wap" then
Response.write "<a href='/bbs/Reg/ltdl.asp'>游客</a>"
else
Response.write "<a href='/bbs/Reg/Useinfo.asp?id="&iduse&"&amp;wap="&wap&"'>"& converttowide(gfdsa)&"</a>"
Response.write "<br/><a href='new.asp?wap=" & wap & "'>最新</a>|"
Response.write "<a href='huo.asp?wap=" & wap & "'>热门</a>|"
response.write "<a href='wdtj.asp?wap=" & wap & "'>推荐</a>|<a href='xcsm.asp?wap=" & wap & "'>帮助</a>"
end if
 %> <br/>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select top 3 * from myalbum where bz='1' order by times desc"
  objgbrs.open ssql,conn,3,3
if objgbrs.eof then
   Response.write "暂时没有新上传相片<br/>"
  else

For k=1 to objgbrs.PageSize
Response.write "<a href='/bbs/Myalbum/Myalbum.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'><img src='" & objgbrs("xclink") & "' width='40' height='35' alt='相'/></a>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if%><br/>
<%
Response.write "<a href='tjtp.asp?wap=" & wap & "'>我要添加</a>|<a href='/bbs/wapcs/wap2.asp?wap=" & wap & "'>我要上传</a><br/>"
Response.write "<a href='myalbum1.asp?id=" & iduse & "&amp;wap=" & wap & "'>我的相册</a>|<a href='mybook.asp?wap=" & wap & "'>我的书包</a><br/>"
%> ----------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index1.asp?wap=<%=wap%>'>首页</a><br/>
时间:<%=time()%></p></card></wml>
<%conn.close
	Set conn = Nothing%>
