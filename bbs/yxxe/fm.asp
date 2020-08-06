<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="原始森林">
<p>
<%
Server.ScriptTimeout=999
wap=request("wap")
ids=session("useid")
pid="1"
%>
<!--#include file="conn.asp"-->
<!--#include file="pk1.asp"-->
<%
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
if rss("tl")<=1 then
Response.Write "你要注意身体啊!这么点力气还要上山,万一遇到了狼虫虎豹,不是玩完了吗?赶快回去吧!<br/>"
else
dim suiji(21)
suiji(0)="0"
	suiji(1)="0"
	suiji(2)="0"
	suiji(3)="0"
	suiji(4)="0"
	suiji(5)="0"
	suiji(6)="0"
	suiji(7)="0"
	suiji(8)="0"
	suiji(9)="0"
	suiji(10)="1"
	suiji(11)="1"
	suiji(12)="1"
	suiji(13)="1"
	suiji(14)="1"
	suiji(15)="2"
	suiji(16)="2"
	suiji(17)="2"
	suiji(18)="2"
	suiji(19)="3"
	suiji(20)="3"
	Randomize
	I=Int(Rnd()*21)
	mld=suiji(I)
dim suiji1(11)
        suiji1(0)="0"
	suiji1(1)="0"
	suiji1(2)="0"
	suiji1(3)="0"
	suiji1(4)="0"
	suiji1(5)="0"
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
Response.Write "您有没有用力砍呀?什么也没砍下,白费力气!体力-1<br/>"
else
Response.Write "经过您的努力，您砍下了木料"&mld&"棵,体力-1<br/>"
end if
sql="update wupin set ml=ml+'"&mld&"' where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
sql="update sx set tl=tl-1 where cstr(ids)='"&ids& "'"
  conn.Execute(sql)
Response.Write "<a href='fm.asp?t=" & time() & "&amp;wap=" & wap & "'>继续伐木</a><br/><a href='index.asp?wap="&wap&"'>不伐木了,回去</a><br/>"
else
response.redirect "pk.asp?pid=1&wap="&wap&""
end if
end if
      Set rss=Nothing
     Conn.Close
      Set Conn=Nothing
%>
=========<br/>
<a href="index.asp?wap=<%=wap%>">江湖首页</a><br/>
<a href="/bbs/index.asp?wap=<%=wap%>">社区首页</a><br/>
<a href="/index.asp?wap=<%=wap%>">网站首页</a><br/>
</p>
</card>
</wml>