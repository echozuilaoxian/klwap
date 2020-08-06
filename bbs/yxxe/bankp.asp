<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖银行">
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
strsQL="select yz,jk from wupin where cstr(ids)="&session("useid")
rs.open strsQL,Conn
jk=rs("jk")
  rs.Close
	Set rs=Nothing
 Conn.Close
      Set Conn=Nothing
%>
提取银子
<br/>--------<br/>
您银行有银子<%=jk%>两.
<br/>请问您要提取多少两银子呢?
<br/>我要提取<input name="num" size="3" format="*N" value="0" /><anchor>两银子<go method="post" href="bankpcl.asp?SessionID=<%=SessionID%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
---------<br/>
<a href="yz.asp?SessionID=<%=SessionID%>">江湖银号</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>