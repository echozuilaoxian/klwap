<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="王五药铺">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
%>
<%
Response.Write "欢迎光临江湖药铺<br/>丹药价格如下:<br/>"
Response.Write "-------------<br/>"
Response.Write "<img src='y1.gif' alt='百草丹'/><br/>"
Response.Write "药名:<a href='yao1.asp?wid=1&amp;SessionID="&SessionID&"'>百草丹</a><br/>"
Response.Write "作用:恢复100点血量<br/>"
Response.Write "价格:100两/粒<a href='yao1.asp?wid=1&amp;SessionID="&SessionID&"'>[买]</a><br/>------<br/>"
Response.Write "<img src='y2.gif' alt='大力神丹'/><br/>"
Response.Write "药名:<a href='yao1.asp?wid=2&amp;SessionID="&SessionID&"'>大力神丹</a><br/>"
Response.Write "作用:恢复200点血量<br/>"
Response.Write "价格:200两/粒<a href='yao1.asp?wid=2&amp;SessionID="&SessionID&"'>[买]</a><br/>------<br/>"
Response.Write "<img src='y3.gif' alt='九转还魂丹'/><br/>"
Response.Write "药名:<a href='yao1.asp?wid=3&amp;SessionID="&SessionID&"'>九转还魂丹</a><br/>"
Response.Write "作用:恢复300点血量<br/>"
Response.Write "价格:500两/粒<a href='yao1.asp?wid=3&amp;SessionID="&SessionID&"'>[买]</a><br/>------<br/>"
Response.Write "<img src='y4.gif' alt='少林大还丹'/><br/>"
Response.Write "药名:<a href='yao1.asp?wid=4&amp;SessionID="&SessionID&"'>少林大还丹</a><br/>"
Response.Write "作用:恢复600点血量<br/>"
Response.Write "价格:1000两/粒<a href='yao1.asp?wid=4&amp;SessionID="&SessionID&"'>[买]</a><br/>------<br/>"
Response.Write "<img src='y5.gif' alt='江湖强力魔水'/><br/>"
Response.Write "药名:<a href='yao1.asp?wid=5&amp;SessionID="&SessionID&"'>江湖强力魔水</a><br/>"
Response.Write "作用:恢复60000点血量<br/>"
Response.Write "价格:100000两/粒<a href='yao1.asp?wid=5&amp;SessionID="&SessionID&"'>[买]</a><br/>"
Response.Write "-------------<br/>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>