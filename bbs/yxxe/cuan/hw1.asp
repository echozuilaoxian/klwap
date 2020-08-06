<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
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
if rs("hw10")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw10.gif' alt='-klwll.cn-'/><br/>圣剑:(" & rs("hw10") &"本)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw10&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw10&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("hw11")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw11.gif' alt='-klwll.cn-'/><br/>钻石星尘:(" & rs("hw11") &"本)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw11&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw11&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("hw12")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw12.gif' alt='-klwll.cn-'/><br/>魔宫玫瑰:(" & rs("hw12") &"本)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw12&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw12&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("hw13")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw13.gif' alt='-klwll.cn-'/><br/>七彩石:(" & rs("hw13") &"个)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw13&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw13&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("hw14")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw14.gif' alt='-klwll.cn-'/><br/>珠宝粉:(" & rs("hw14") &"个)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw14&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw14&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("hw15")<>0 then
Response.Write "<img src='/BBS/yxxe/img/hw15.gif' alt='-klwll.cn-'/><br/>金刚石:(" & rs("hw15") &"个)<br/>"
Response.Write "<a href='/BBS/yxxe/zbhc.asp?SessionID="&SessionID&"'>合成装备</a>|<a href='/BBS/yxxe/song.asp?wpid=hw15&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hw15&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
Response.Write "------------<br/><a href='hw.asp?SessionID="&SessionID&"'>返回上一页</a><br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
------------<br/>

<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>