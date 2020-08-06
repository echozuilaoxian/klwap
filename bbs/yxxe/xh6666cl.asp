<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")

%>
<card title="修改成功">
<p>
<!--#include file="kyaa.asp"-->
<%
set rss=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rss.open strSQL,Conn,1,1
dengji=clng(rss("dj"))
kid=request("kid")
id=request("id")
n=request("n")
if kid="1" then
Response.Write "<b><u>巨型号角</u></b>！<br/>数量:"&n& " 本<br/>"
sql="update wupin set hw1=hw1+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="2" then
Response.Write "<b><u>星光灭绝</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw2=hw2+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="3" then
Response.Write "<b><u>魔皇粉星拳</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw3=hw3+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="4" then
Response.Write ":<b><u>情人花</u></b>！<br/>数量:" &n& " 朵<br/>"
sql="update wupin set y6=y6+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="5" then
Response.Write "<b><u>积尸冥界波</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw4=hw4+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="6" then
Response.Write "<b><u>天魔降伏</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw5=hw5+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="7" then
Response.Write "<u>狮牙拳</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw6=hw6+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="8" then
Response.Write "<b><u>江湖强力魔水</u></b>！<br/>数量:" &n& " 颗<br/>"
sql="update wupin set y5=y5+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="9" then
Response.Write "<b><u>银子</u></b>！<br/>数量:" &n& " 两<br/>"
sql="update wupin set yz=yz+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="10" then
Response.Write ":<b><u>宝石</u></b>！<br/>数量:" &n& " 颗<br/>"
sql="update wupin set bs=bs+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="11" then
Response.Write "<b><u>庐山百龙霸</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw7=hw7+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="12" then
Response.Write "<b><u>红色毒针</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw8=hw8+" &n& " where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="13" then
Response.Write "<b><u>黄金箭</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw9=hw9+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="14" then
Response.Write "<b><u>圣剑</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw10=hw10+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="15" then
Response.Write "<b><u>钻石星尘</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw11=hw11+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="16" then
Response.Write "<b><u>魔宫玫瑰</u></b>！<br/>数量:" &n& " 本<br/>"
sql="update wupin set hw12=hw12+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="17" then
Response.Write "<b><u>七彩石</u></b>！<br/>数量:" &n& " 个<br/>"
sql="update wupin set hw13=hw13+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="18" then
Response.Write "<b><u>珠宝粉</u></b>！<br/>数量:" &n& " 个<br/>"
sql="update wupin set hw14=hw14+" &n& "  where cstr(ids)='"&id& "'"
  conn.Execute(sql)
elseif kid="19" then
Response.Write "<b><u>金刚石</u></b>！<br/>数量:" &n& " 个<br/>"
sql="update wupin set hw15=hw15+" &n& "  where cstr(ids)='"&id& "'"
 conn.Execute(sql)
elseif kid="20" then
Response.Write "<b><u>铜矿</u></b>！<br/>数量:" &n& " 个<br/>"
sql="update wupin set j2=j2+" &n& "  where cstr(ids)='"&id& "'"
  
  conn.Execute(sql)
end if
      Set rss=Nothing
     Conn.Close
      Set Conn=Nothing
%>
=========<br/>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>