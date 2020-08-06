<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的海鲜">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select h1,h2,h3,h4 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "小虾：(" & rs("h1") &"条)<br/><a href='mai.asp?wpid=h1&amp;SessionID="&SessionID&"'>出售</a>|<a href='song.asp?wpid=h1&amp;SessionID="&SessionID&"'>送人</a><br/>鲤鱼:(" & rs("h2") &"条)<br/><a href='mai.asp?wpid=h2&amp;SessionID="&SessionID&"'>出售</a>|<a href='song.asp?wpid=h2&amp;SessionID="&SessionID&"'>送人</a><br/>螃蟹:(" & rs("h3") &"只)<br/><a href='mai.asp?wpid=h3&amp;SessionID="&SessionID&"'>出售</a>|<a href='song.asp?wpid=h3&amp;SessionID="&SessionID&"'>送人</a><br/>大水鱼:(" & rs("h4") &"只)<br/><a href='mai.asp?wpid=h4&amp;SessionID="&SessionID&"'>出售</a>|<a href='song.asp?wpid=h4&amp;SessionID="&SessionID&"'>送人</a><br/>"
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>