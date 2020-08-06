<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的魔法卷">
<p>
<!--#include file="conn.asp"-->
<%
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select mm1,mm2,mm3,mm4 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
%>
     圣盾术:(<%=rs("mm1")%>张)<a href='jaocl.asp?wpid=mm1&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>
<br/>烈火术:(<%=rs("mm2")%>张)<a href='jaocl.asp?wpid=mm2&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>
<br/>瞬移术:(<%=rs("mm3")%>张)<a href='jaocl.asp?wpid=mm3&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>
<br/>刺杀术:(<%=rs("mm4")%>张)<a href='jaocl.asp?wpid=mm4&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a><br/>

<%
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">我的江湖</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>