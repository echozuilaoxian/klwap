<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖银号">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?num="&num&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<!--#include file="conn.asp"-->
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)="&session("useid")
rs.open strsQL,Conn
yz=rs("yz")
  rs.Close
	Set rs=Nothing
 Conn.Close
      Set Conn=Nothing
%>
您手头有银子<%=yz%>两.
<br/>请问您要存入多少两银子到银行呢?<br/>
你说:<br/>我要存<input name="num" size="3" format="*N" value="0" /><anchor>两银子<go method="post" href="bankcl.asp?SessionID=<%=SessionID%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
---------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>