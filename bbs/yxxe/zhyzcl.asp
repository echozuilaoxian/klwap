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
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?num="&num&""
    End if
ids=session("useid")
%>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/usejf.asp"-->
<!--#include file="conn.asp"-->
<%
wap=request("wap")
ids=session("useid")
num=clng(request("num"))
yznum=clng(num/10)
if num<0 or num>usejf then
Response.Write "您没有这么多金币呀<br/>---------<br/><a href='zhyz.asp?SessionID="&SessionID&"'>返回重写</a><br/><a href='index.asp?SessionID="&SessionID&"'>我的江湖</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>社区首页</a><br/></p></card></wml>"
Response.end 
end if
if num>1000000 then
Response.Write "最多可以用1000000金币兑换100000两银子(不限次数)!<br/>---------<br/><a href='zhyz.asp?SessionID="&SessionID&"'>返回重写</a><br/><a href='index.asp?SessionID="&SessionID&"'>我的江湖</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>社区首页</a><br/></p></card></wml>"
Response.end 
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from jfpost where cstr(ids)="&ids
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs("usejf")=rs("usejf")+yznum
rs.update
rs.Close
set rs=Nothing

set rs3=Server.CreateObject("ADODB.Recordset")
strsQL="select * from wupin where cstr(ids)="&ids
rs3.open strsQL,Conn,1,2
if rs3.recordcount<1 then
rs3.addnew
rs3("ids")=ids
rs3("yz")=rs1("yz")+yznum
rs3.update
else
rs3("yz")=rs3("yz")+yznum
rs3.update
end if
 rs3.Close
set rs3=Nothing
%>
<!--#include file="user1.asp"-->
<% 
msg="转换成功!"
else
usejf1=clng(rs("usejf"))
if rs("usejf")>=100000 then
msg="100000两银子,不能再兑换银子!"
elseif usejf1+yznum>100000 then
msg=""&usejf1&"两银子,只能再兑换"&(100000-usejf1)&"两银子!"
else
%>
<!--#include file="user1.asp"-->
<% 
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from jfpost where cstr(ids)="&ids
rs.open strsQL,Conn,1,2
rs("usejf")=rs("usejf")+yznum
rs.update
 rs.Close
set rs=Nothing

set rs3=Server.CreateObject("ADODB.Recordset")
strsQL="select * from wupin where cstr(ids)="&ids
rs3.open strsQL,Conn,1,2
if rs3.recordcount<1 then
rs3.addnew
rs3("ids")=ids
rs3("yz")=rs1("yz")+yznum
rs3.update
else
rs3("yz")=rs3("yz")+yznum
rs3.update
end if
 rs3.Close
set rs3=Nothing

msg="转换成功!"
end if %>
<%
msg="转换成功!"
end if
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