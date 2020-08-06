<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖银行">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
    End if
ids=session("useid")
%>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/usejf.asp"-->
<%
ids=session("useid")
%>
您现在有金币<%=usejf%>,
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)="&session("useid")
rs.open strsQL,Conn
yz=rs("yz")

%>您手头有银子<%=yz%>两
<br/>银子与金币的汇率为1:5,即10两银子能换50金币<br/>请问您要用多少银子兑换金币呢?<br/>
你说:我要用<input name="num" size="3" format="*N" value="0" />
<br/><anchor>银子兑换<go method="post" href="zhyzcz1.asp?SessionID=<%=SessionID%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
---------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>
<%
  rs.Close
	Set rs=Nothing
 Conn.Close
      Set Conn=Nothing
%>