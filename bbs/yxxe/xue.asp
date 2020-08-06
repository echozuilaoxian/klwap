<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="李四靴子店">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>
<%
Response.Write "告示：本店明码实价，童叟无欺，概不赊帐！"
Response.Write "<br/>李四：这位少侠，请问您要买什么靴子"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/>靴子列表|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
Response.Write "<br/>--------------"
Response.Write "<br/><img src='x/1.gif' alt='江湖...'/>"
Response.Write "<br/>光芒靴银子200两<br/>需要等级<b><u>0</u></b>级<br/>增加防御10[<a href='tie2.asp?wid=15&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='x/2.gif' alt='江湖...'/>"
Response.Write "<br/>战神靴银子400两<br/>需要等级<b><u>3</u></b>级<br/>增加防御20[<a href='tie2.asp?wid=16&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='x/3.gif' alt='江湖...'/>"
Response.Write "<br/>天使靴银子750两<br/>需要等级<b><u>5</u></b>级<br/>增加防御30[<a href='tie2.asp?wid=17&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='x/4.gif' alt='江湖...'/>"
Response.Write "<br/>黄金靴银子1200两<br/>需要等级<b><u>8</u></b>级<br/>增加防御40[<a href='tie2.asp?wid=18&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='x/5.gif' alt='江湖...'/>"
Response.Write "<br/>毁灭靴银子1800两<br/>需要等级<b><u>10</u></b>级<br/>增加防御50[<a href='tie2.asp?wid=19&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='x/6.gif' alt='江湖...'/>"
Response.Write "<br/>蝴蝶靴甲2500两<br/>需要等级<b><u>12</u></b>级<br/>增加防御60[<a href='tie2.asp?wid=20&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"


Response.Write "<br/><img src='x/7.gif' alt='江湖...'/>"
Response.Write "<br/>龙王靴:银子10000两<br/>需要等级<b><u>16</u></b>级<br/>增加防御70[<a href='tie2.asp?wid=30&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/>靴子列表|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
%>
<br/><a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>