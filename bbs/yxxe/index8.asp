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
      itidtit="毒蛇山谷"
   Case "2"
      itidtit="死亡棺材"
   Case "3"
      itidtit="真云天空"
   Case "4"
      itidtit="蛮荒部落"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<!--#include file="kyaa.asp"-->
<%
if pid="1" then
Response.Write "<img src='dus.gif' alt='毒蛇山谷'/><br/>毒蛇山谷<br/>10级以下练级专区.不掉任何宝物.<br/><a href='ljzq.asp?pid=1&amp;SessionID="&SessionID&"'>[-进入-]</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>[-返回-]</a>"
elseif pid="2" then
Response.Write "<img src='sw.gif' alt='死亡棺材'/><br/>死亡棺材<br/>20级以下练级专区.不掉任何宝物.<br/><a href='ljzq.asp?pid=2&amp;SessionID="&SessionID&"'>[-进入-]</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>[-返回-]</a>"
elseif pid="3" then
Response.Write "<img src='zy.gif' alt='真云天空'/><br/>真云天空<br/>30级以下练级专区.不掉任何宝物.<br/><a href='ljzq.asp?pid=3&amp;SessionID="&SessionID&"'>[-进入-]</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>[-返回-]</a>"
else
Response.Write "<img src='mh.gif' alt='蛮荒部落'/><br/>蛮荒部落<br/>40级以下练级专区.不掉任何宝物.<br/><a href='ljzq.asp?pid=4&amp;SessionID="&SessionID&"'>[-进入-]</a><br/><a href='index.asp?wid=2&amp;SessionID="&SessionID&"'>[-返回-]</a>"
end if
%>
<!--#include file="liao.asp"-->
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>