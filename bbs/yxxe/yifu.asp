<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="李四服装店">
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
Response.Write "<br/>李四：这位少侠，请问您要买什么服装"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|衣服列表"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
Response.Write "<br/>--------------"
Response.Write "<br/><img src='y/1.gif' alt='江湖...'/>"
Response.Write "<br/>光芒甲银子200两<br/>需要等级<b><u>0</u></b>级<br/>增加防御15[<a href='tie2.asp?wid=8&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/2.gif' alt='江湖...'/>"
Response.Write "<br/>战神甲银子400两<br/>需要等级<b><u>3</u></b>级<br/>增加防御25[<a href='tie2.asp?wid=9&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/3.gif' alt='江湖...'/>"
Response.Write "<br/>天使甲银子750两<br/>需要等级<b><u>5</u></b>级<br/>增加防御40[<a href='tie2.asp?wid=10&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/4.gif' alt='江湖...'/>"
Response.Write "<br/>黄金甲银子1200两<br/>需要等级<b><u>8</u></b>级<br/>增加防御65[<a href='tie2.asp?wid=11&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/5.gif' alt='江湖...'/>"
Response.Write "<br/>毁灭甲银子1800两<br/>需要等级<b><u>10</u></b>级<br/>增加防御90[<a href='tie2.asp?wid=12&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/6.gif' alt='江湖...'/>"
Response.Write "<br/>蝴蝶甲2500两<br/>需要等级<b><u>12</u></b>级<br/>增加防御120[<a href='tie2.asp?wid=13&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"

Response.Write "<br/><img src='y/7.gif' alt='江湖...'/>"
Response.Write "<br/>龙王甲:银子10000两<br/>需要等级<b><u>16</u></b>级<br/>增加防御150[<a href='tie2.asp?wid=14&amp;SessionID="&SessionID&"'>买</a>]"
Response.Write "<br/>--------------"
Response.Write "<br/><a href='tie.asp?SessionID="&SessionID&"'>武器列表</a>|衣服列表"
Response.Write "<br/><a href='xue.asp?SessionID="&SessionID&"'>靴子列表</a>|<a href='shouSHI.asp?SessionID="&SessionID&"'>头盔列表</a>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>