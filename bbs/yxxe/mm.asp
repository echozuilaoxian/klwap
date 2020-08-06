<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的魔法卷轴">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>
<%
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select mm1,mm2,mm3,mm4 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
%>
<img src='img/m1.gif' alt='圣盾术'/><br/>圣盾术:(<%=rs("mm1")%>张)<br/>
<%if rs("mm1")<>0 then%>
<a href='jaocl.asp?wpid=mm1&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>|<a href='song.asp?wpid=mm1&amp;SessionID=<%=SessionID%>'>送人</a><br/>
<%end if%>
<img src='img/m2.gif' alt='烈火术'/><br/>烈火术:(<%=rs("mm2")%>张)<br/>
<%if rs("mm2")<>0 then%>
<a href='jaocl.asp?wpid=mm2&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>|<a href='song.asp?wpid=mm2&amp;SessionID=<%=SessionID%>'>送人</a><br/>
<%end if%>
<img src='img/m3.gif' alt='瞬移术'/><br/>瞬移术:(<%=rs("mm3")%>张)<br/>
<%if rs("mm3")<>0 then%>
<a href='jaocl.asp?wpid=mm3&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>|<a href='song.asp?wpid=mm3&amp;SessionID=<%=SessionID%>'>送人</a><br/>
<%end if%>
<img src='img/m4.gif' alt='刺杀术'/><br/>刺杀术:(<%=rs("mm4")%>张)<br/>
<%if rs("mm4")<>0 then%>
<a href='jaocl.asp?wpid=mm4&amp;SessionID=<%=SessionID%>&amp;pid=<%=pid%>'>使用</a>|<a href='song.asp?wpid=mm4&amp;SessionID=<%=SessionID%>'>送人</a><br/>
<%end if%>
=========<br/>
<%rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="bang.asp?SessionID=<%=SessionID%>">购买魔法卷</a><br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">我的包袱</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">我的江湖</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>
