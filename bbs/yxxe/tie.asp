<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="李四商店">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
Response.Write "告示：本店明码实价，童叟无欺，概不赊帐！"
Response.Write "<br/>李四：这位少侠，请问要买什么装备？"
Response.Write "<br/>--------------"
Response.Write "<br/>武器列表|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
Response.Write "<br/>--------------"
Response.Write "<br/><img src='w/1.gif' alt='江湖...'/>"
Response.Write "<br/>光芒剑:银子200两<br/>需要等级<b><u>0</u></b>级<br/>攻击力:15[<a href='tie2.asp?wid=1&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='w/2.gif' alt='江湖...'/>"
Response.Write "<br/>战神剑:银子500两<br/>需要等级<b><u>3</u></b>级<br/>攻击力:25[<a href='tie2.asp?wid=2&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='w/3.gif' alt='江湖...'/>"
Response.Write "<br/>天使剑:银子1000两<br/>需要等级<b><u>5</u></b>级<br/>攻击力:40[<a href='tie2.asp?wid=3&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='w/4.gif' alt='江湖...'/>"
Response.Write "<br/>黄金剑:银子1650两<br/>需要等级<b><u>8</u></b>级<br/>攻击力:60[<a href='tie2.asp?wid=4&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='w/5.gif' alt='江湖...'/>"
Response.Write "<br/>毁灭剑:银子2400两<br/>需要等级<b><u>10</u></b>级<br/>攻击力:90[<a href='tie2.asp?wid=5&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='w/6.gif' alt='江湖...'/>"
Response.Write "<br/>蝴蝶剑:银子3000两<br/>需要等级<b><u>12</u></b>级<br/>攻击力:120[<a href='tie2.asp?wid=6&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"


Response.Write "<br/><img src='w/7.gif' alt='江湖...'/>"
Response.Write "<br/>龙王剑:银子10000两<br/>需要等级<b><u>16</u></b>级<br/>攻击力:150[<a href='tie2.asp?wid=7&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"
Response.Write "<br/>武器列表|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
Response.Write "<br/>--------------"
%>
<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>