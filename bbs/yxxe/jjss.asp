<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<card title="接受挑战">
<p>
<%
set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select * from tz where id="&id
rsppp.open rsstr,conn,1,2
lid=rsppp("lid")
   rsppp.close
set rsppp=Nothing
set rssx=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rssx.open strSQL,Conn,1,1
if rssx("ids")=lid then
Response.Write "晕~自己和自己挑战？<br/>难道你是东方不败？<br/>只求一败么？<br/><a href='tt.asp?SessionID="&SessionID&"'>回到大厅</a>"
elseif rssx("tl")<=1 then
Response.Write "您只有这么点体力！来送死的吗？<br/>回去补血再来吧！<br/><a href='tt.asp?SessionID="&SessionID&"'>回到大厅</a>"
   rssx.close
set rssx=Nothing
else
%>
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from wupin where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
tzyz=rs("yz")
   rs.close
set rs=Nothing
%>

<%
set rspp=Server.CreateObject("ADODB.Recordset")
rsstr="select * from tz where id="&id
rspp.open rsstr,conn,1,2
yz=rspp("txt")
if rspp("txt")> tzyz then
Response.Write "对不起！您的银子不够参加本次挑战！<br/>本次需要"&yz&"两银子<br/>您只有"&tzyz&"两，快去赚一点吧！<br/><a href='tt.asp?SessionID="&SessionID&"'>回到大厅</a>"
else
name=rspp("name")
tzyz=rspp("txt")
if ids<>"" then rspp("pid")=ids
rspp.Update
rspp.close
set rspp=nothing
%>
成功接受与<br/>
[<a href="dfzl.asp?id=<%=lid%>&amp;SessionID=<%=SessionID%>"><%=name%></a>]的PK!!<br/>
<anchor>开始PK>><go href="sfpk.asp?SessionID=<%=SessionID%>&amp;t=<%=time%>" method="post">
<postfield name="id" value="<%=id%>" />
</go></anchor>

<%end if%>
<%end if%>


<br/>=========<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p>
</card>
</wml>