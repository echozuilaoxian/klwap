<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖银号">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?num="&num&""
    End if
ids=session("useid")
%>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/usejf.asp"-->
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)="&session("useid")
rs.open strsQL,Conn
yz=rs("yz")
%>
<%
wap=request("wap")
ids=session("useid")
num=clng(request("num"))
if num>yz then
Response.Write "您没有这么多银子呀<br/>---------<br/><a href='zhyz1.asp?SessionID="&SessionID&"'>返回重写</a><br/><a href='index.asp?SessionID="&SessionID&"'>我的江湖</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>社区首页</a><br/></p></card></wml>"
Response.end 
end if
if num<0 then
Response.Write "没钱就没钱有点骨气好不好<br/>---------<br/><a href='zhyz1.asp?SessionID="&SessionID&"'>返回重写</a><br/><a href='index.asp?SessionID="&SessionID&"'>我的江湖</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>社区首页</a><br/></p></card></wml>"
Response.end 
end if
Server.ScriptTimeout=999
set rs3=Server.CreateObject("ADODB.Recordset")
strsQL="select * from wupin where cstr(ids)="&ids
rs3.open strsQL,Conn,1,2
if rs3.recordcount<1 then
rs3.addnew
rs3("ids")=ids
rs3("yz")=rs1("yz")-num
rs3.update
else
rs3("yz")=rs3("yz")-num
rs3.update
end if
 rs3.Close
set rs3=Nothing
%>
<!--#include file="user2.asp"-->
<% 
msg="转换成功!"

Conn.Close
      Set Conn=Nothing
%>
<%=msg%><br/>
---------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">我的江湖</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>