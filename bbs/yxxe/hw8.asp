<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="合成轩辕煞魂斩">
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
strsQL="select j2,bs,y6,hw1,hw2,hw3,w7,yz from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs("j2")<5 then
msg="您的铜矿数量不够！需要五块"
else
if rs("bs")<1 then
msg="您没有宝石"
else
if rs("y6")<1 then
msg="您没有情人花"
else
if rs("hw1")<3 then
msg="您没有巨型号角"
else
if rs("hw2")<3 then
msg="您没有星光灭绝"
else
if rs("hw3")<3 then
msg="您没有魔皇粉星拳"
else
if rs("yz")<100000 then
msg="您的银两不够扣除手续费"
else
if rs("w7")<5 then
msg="您的龙王剑数量不够"
else
sql="update wupin set w8=w8+1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set j2=j2-5 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set bs=bs-1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set y6=y6-1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw1=hw1-3 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw2=hw2-3 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw3=hw3-3 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-100000 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set w7=w7-5 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您成功合成物品<b><u>轩辕煞魂斩</u></b>"
END IF
end if
end if
end if
END IF
end if
end if
end if
Response.Write ""&msg&"<br/>========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="mywp.asp?SessionID=<%=SessionID%>">我的物品</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>