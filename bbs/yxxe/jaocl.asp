<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="使用魔法卷轴" ontimer="index.asp?SessionID=<%=request("SessionID")%>">
<timer value="10"/>
<p>
<!--#include file="conn.asp"-->
<%
wpid=request("wpid")
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&"&wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该物品！快去<a href='bang.asp?SessionID="&SessionID&"'>魔导师</a>那里买一点吧"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select jy,tl,jj,xx,sd from sx where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
myjy=rs8("jy")
mytl=rs8("tl")
myxx=rs8("xx")
 rs8.Close
	Set rs8=Nothing
if wpid="mm1" then
sql="update sx set jj=2 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您使用了圣盾术,现在拥有2回合的免疫任何攻击的结界了.<br/>您的体力为"&mytl&"<br/>"
elseif wpid="mm2" then
sql="update sx set sd=3 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您使用了烈火术,现在拥有3回合的双倍攻击魔法能力了.<br/>您的体力为"&mytl&"<br/>"
elseif wpid="mm3" then
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您使用了瞬移术,请快<a href='shunyi.asp?SessionID="&SessionID&"&amp;pid="&pid&"'>点击这里</a>退出战场.<br/>您的体力为"&mytl&"<br/>"
elseif wpid="mm4" then
sql="update sx set xx=6 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您使用了刺杀术,现在拥有6回合的双倍攻击魔法能力了.<br/>您的体力为"&mytl&"<br/>"
END IF
end if
Response.Write ""&msg&"正在返回！<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>