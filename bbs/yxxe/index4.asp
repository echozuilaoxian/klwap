<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Select Case pid
   Case "1"
      itidtit="原始森林"
   Case "2"
      itidtit="魔鬼山洞"
   Case "3"
      itidtit="丰富矿山"
   Case "4"
      itidtit="浩瀚北海"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<!--#include file="kyaa.asp"-->
<%
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
if rss("tl")<=1 then
Response.Write "你要注意身体啊!这么点力气还要出海吗,万一遇到了水怪鲨鱼,不是玩完了吗?赶快回去吧!<br/>"
else
dim suiji(21)
suiji(0)="0"
	suiji(1)="0"
	suiji(2)="0"
	suiji(3)="0"
	suiji(4)="1"
	suiji(5)="1"
	suiji(6)="1"
	suiji(7)="1"
	suiji(8)="1"
	suiji(9)="1"
	suiji(10)="1"
	suiji(11)="1"
	suiji(12)="2"
	suiji(13)="2"
	suiji(14)="2"
	suiji(15)="2"
	suiji(16)="3"
	suiji(17)="3"
	suiji(18)="3"
	suiji(19)="4"
	suiji(20)="4"
	Randomize
	I=Int(Rnd()*21)
	mld=suiji(I)
dim suiji1(11)
        suiji1(0)="0"
	suiji1(1)="0"
	suiji1(2)="0"
	suiji1(3)="0"
	suiji1(4)="1"
	suiji1(5)="1"
	suiji1(6)="0"
	suiji1(7)="0"
	suiji1(8)="0"
	suiji1(9)="1"
	suiji1(10)="0"
	Randomize
	I=Int(Rnd()*11)
	sjid=suiji1(I)
if sjid="0" then
if mld="0" then
Response.Write "您什么也没钓到!<br/>"
elseif mld="3" then
Response.Write "您钓上了一条小虾<br/>"
sql="update wupin set y1=y1+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="1" then
Response.Write "您钓上了一条鲤鱼<br/>"
sql="update wupin set y2=y2+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
elseif mld="2" then
Response.Write "您钓上了一只螃蟹<br/>"
sql="update wupin set y3=y3+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
else
Response.Write "您钓上了一只大水鱼<br/>"
sql="update wupin set y4=y4+1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
end if
Response.Write "<a href='index4.asp?pid=4&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>继续钓鱼</a><br/><a href='index.asp?SessionID=" & SessionID & "'>不钓鱼了,回去</a><br/>"
else
response.redirect "pk.asp?pid="&pid&"&SessionID=" & SessionID & ""
end if
end if
      Set rss=Nothing
     Conn.Close
      Set Conn=Nothing
%>
=========<br/>
<a href='jao.asp?pid=<%=pid%>&amp;SessionID=<%=SessionID%>'>使用魔法卷轴</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>