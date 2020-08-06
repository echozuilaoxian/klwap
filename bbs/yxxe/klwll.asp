<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE file="conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="login" title="会员属性管理">
<p>

<% 
Server.ScriptTimeout=999
SessionID=request("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
 ky=request("ky")
  if ky="" then
	ky=1
end if
ids=request("ids")
if Session("Counter")="pass_numbers_55556666" then
 if ky=1 then
%>

                                      
                                     会员ＩＤ：<br/>
		<input name="ids" maxlength="11" format="*N" size="20"/><br/>
		<anchor>确定修改
		<go href="klwll.asp?SessionID=<%=SessionID%>" method="post">
		<postfield name="ky" value="2" />
                                      <postfield name="ids" value="$(ids)" />
		</go>
		</anchor><br/>
<%elseif ky="2" then
set rs=Server.CreateObject("ADODB.Recordset")
ssql6="select * from sx where ids=" & ids & ""
  rs.open ssql6,conn,1,2
 if rs.EOF then 
 Response.write "没有这会员.<br/>"
else
%>
会员编号:<%=rs("ids")%><br/>
经验:<input name='jy' title='经验' value='<%=rs("jy")%>'/><br/>
生命:<input name='tl' title='生命' value='<%=rs("tl")%>'/><br/>
等级:<input name='dj' title='等级'  value='<%=rs("dj")%>'/><br/>
防备:<input name='fs' title='防备' value='<%=rs("fs")%>'/><br/>
攻击:<input name='gj' title='攻击' value='<%=rs("gj")%>'/><br/>
胜利次数:<input name='pk' title='胜利次数' value='<%=rs("pk")%>'/><br/>
失败次数:<input name='pk1' title='失败次数'  value='<%=rs("pk1")%>'/><br/>
<anchor>修改<go href='klwll.asp?SessionID=<%=SessionID%>&amp;ky=3' method='post' accept-charset='utf-8'>
<postfield name='jy' value='$(jy)'/>
<postfield name='tl' value='$(tl)'/>
<postfield name='dj' value='$(dj)'/>
<postfield name='fs' value='$(fs)'/>
<postfield name='gj' value='$(gj)'/>
<postfield name='pk' value='$(pk)'/>
<postfield name='pk1' value='$(pk1)'/>
<postfield name='ids' value='<%=ids%>'/>
</go></anchor><br/>-----------<br/>
<%
end if
Rs.close
Set rs= Nothing
elseif ky="3" then
jy=request("jy")
tl=request("tl")
 dj=request("dj")
 fs=request("fs")
 gj=request("gj")
pk=request("pk")
pk1=request("pk1")

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sx where ids="&ids
rs.open rspl,conn,1,2
 if rs.EOF then 
 Response.write "没有这会员.<br/>"
else
if dj<>"" then rs("dj")=dj
if tl<>"" then rs("tl")=tl
if jy<>"" then rs("jy")=jy
if fs<>"" then rs("fs")=fs
if gj<>"" then rs("gj")=gj
if pk<>"" then rs("pk")=pk
if pk1<>"" then rs("pk1")=pk1
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
成功修改id<u>[<%=ids%>]</u>的资料<br/>
<%
end if
end if
else
%>
你不是管理员,请离开这里<br/>
<%
end if
conn.close
set conn=nothing
%>
<a href="xh6666.asp?SessionID=<%=SessionID%>">管理首页</a><br/>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p></card></wml>