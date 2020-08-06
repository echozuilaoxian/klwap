<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>  
<card id="card1" title="好友设置">  
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID") 
iduse=Session("useid")
lasttlls="200"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=1"
End if

set objgbrss=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
   ssql="select byid from usereg where Cstr(id)='" & iduse & "'"
  objgbrss.open ssql,conn
if objgbrss("byid")=0 then
Response.write "当前设置为:<b><u>不需要验证</u></b>"
 else
if objgbrss("byid")=1 then
Response.write "当前设置为:<b><u>需要验证</u></b>"
else
if objgbrss("byid")=2 then
Response.write "当前设置为:<b><u>不允许任何加为好友</u></b>"
end if
end if
end if
 objgbrss.close
 conn.close
 set objgbrss=nothing
 set conn=nothing
%>
<br/>--------
<br/><a href='myszcl.asp?n=0&amp;SessionID=<%=SessionID%>'>设置</a>:不需要验证
<br/><a href='myszcl.asp?n=1&amp;SessionID=<%=SessionID%>'>设置</a>:需要验证
<br/><a href='myszcl.asp?n=2&amp;SessionID=<%=SessionID%>'>设置</a>:不允许任何加为好友
<br/>--------
<br/><a href='myfriend.asp?SessionID=<%=SessionID%>'>返回我的好友</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/><a href='/index.asp?SessionID=<%=SessionID%>'>返回网站首页</a>
</p>
</card>
</wml>




