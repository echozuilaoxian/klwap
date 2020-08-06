<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="合成装备材料">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select hw1,hw2,hw3,hw4,hw5,hw6,hw7,hw8,hw9,hw10,hw11,hw12,hw13,hw14,hw15 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("hw1")<>0 then
Response.Write "<img src='img/hw1.gif' alt='-yxxe.net-'/><br/>巨型号角:(" & rs("hw1") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw1&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw2")<>0 then
Response.Write "<img src='img/hw2.gif' alt='-yxxe.net-'/><br/>星光灭绝:(" & rs("hw2") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw2&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw3")<>0 then
Response.Write "<img src='img/hw3.gif' alt='-yxxe.net-'/><br/>魔皇粉星拳:(" & rs("hw3") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw3&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw4")<>0 then
Response.Write "<img src='img/hw4.gif' alt='-yxxe.net-'/><br/>积尸冥界波:(" & rs("hw4") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw4&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw5")<>0 then
Response.Write "<img src='img/hw5.gif' alt='-yxxe.net-'/><br/>天魔降伏:(" & rs("hw5") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw5&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw6")<>0 then
Response.Write "<img src='img/hw6.gif' alt='-yxxe.net-'/><br/>狮牙拳:(" & rs("hw6") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw6&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if

if rs("hw7")<>0 then
Response.Write "<img src='img/hw7.gif' alt='-yxxe.net-'/><br/>庐山百龙霸:(" & rs("hw7") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw7&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw8")<>0 then
Response.Write "<img src='img/hw8.gif' alt='-yxxe.net-'/><br/>红色毒针:(" & rs("hw8") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw8&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw9")<>0 then
Response.Write "<img src='img/hw9.gif' alt='-yxxe.net-'/><br/>黄金箭:(" & rs("hw9") &"本)<br/>"
Response.Write "<a href='zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='song.asp?wpid=hw9&amp;SessionID="&SessionID&"'>送人</a><br/>"
end if
if rs("hw10")+rs("hw11")+rs("hw12")+rs("hw13")+rs("hw14")+rs("hw15")<>0 then
Response.Write "-----------<br/><a href='hw1.asp?SessionID="&SessionID&"'>下一页</a><br/>"
end if
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
-----------<br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的物品]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>