<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="李四头盔店">
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
Response.Write "<br/>李四：这位少侠，请问您要买什么头盔"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|头盔列表"
Response.Write "<br/>--------------"
Response.Write "<br/><img src='t/1.gif' alt='江湖...'/>"
Response.Write "<br/>光芒头盔:银子200两<br/>需要等级<b><u>0</u></b>级<br/>攻击力+10[<a href='tie2.asp?wid=21&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/2.gif' alt='江湖...'/>"
Response.Write "<br/>战神头盔:银子400两<br/>需要等级<b><u>3</u></b>级<br/>攻击力+20[<a href='tie2.asp?wid=22&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/3.gif' alt='江湖...'/>"
Response.Write "<br/>天使头盔:银子750两<br/>需要等级<b><u>5</u></b>级<br/>攻击力+30[<a href='tie2.asp?wid=23&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/4.gif' alt='江湖...'/>"
Response.Write "<br/>黄金头盔:银子1200两<br/>需要等级<b><u>8</u></b>级<br/>攻击力+40[<a href='tie2.asp?wid=24&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/5.gif' alt='江湖...'/>"
Response.Write "<br/>毁灭头盔:银子1800两<br/>需要等级<b><u>10</u></b>级<br/>攻击力+50[<a href='tie2.asp?wid=25&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/6.gif' alt='江湖...'/>"
Response.Write "<br/>蝴蝶头盔:银子2500两<br/>需要等级<b><u>12</u></b>级<br/>攻击力+60[<a href='tie2.asp?wid=26&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='t/7.gif' alt='江湖...'/>"
Response.Write "<br/>龙王头盔:银子10000两<br/>需要等级<b><u>16</u></b>级<br/>攻击力+70[<a href='tie2.asp?wid=27&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|<a href='yifu.asp?SessionID="&SessionID&"'>衣服列表</a>"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|头盔列表"
Response.Write "<br/>--------------<br/>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>