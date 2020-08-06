<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
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
if pid="1" then
Response.Write "<img src='ss.jpg' alt='森林'/><br/>这是一片原始森林,遍地尽是好木料.但也有一些狼虫虎豹.<br/><a href='index2.asp?pid=1&amp;SessionID="&SessionID&"'>进入伐木</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>太可怕了,回去吧</a>"
elseif pid="2" then
Response.Write "<img src='sd.jpg' alt='山洞'/><br/>这是魔鬼的山洞,阴冷而恐怖.但这里有很多稀有的宝物.<br/><a href='index2.asp?pid=2&amp;SessionID="&SessionID&"'>进入寻宝</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>太可怕了,回去吧</a>"
elseif pid="3" then
Response.Write "<img src='ks.jpg' alt='矿山'/><br/>这是丰富的矿山.这里有很多有的矿石.进入挖矿请小心陷阱和狼虎!<br/><a href='index2.asp?pid=3&amp;SessionID="&SessionID&"'>进入挖矿</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>我不去了</a>"
else
Response.Write "<img src='bh.jpg' alt='北海'/><br/>这是浩瀚的大海.这里有很多鱼虾.进入钓鱼请小心鲨鱼!<br/><a href='index2.asp?pid=4&amp;SessionID="&SessionID&"'>进入钓鱼</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>我不去了</a>"
end if
%>
<!--#include file="liao.asp"-->
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?wap=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>