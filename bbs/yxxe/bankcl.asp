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
num=clng(request("num"))
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?num="&num&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<!--#include file="conn.asp"-->
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz,jk from wupin where cstr(ids)="&session("useid")
rs.open strsQL,Conn,1,2
yz=clng(rs("yz"))
if yz<0 or yz<num then
Response.Write "您没有这么多银子呀<br/>---------<br/><a href='bank.asp?SessionID="&SessionID&"'>返回重写</a><br/><a href='index.asp?SessionID="&SessionID&"'>我的江湖</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>社区首页</a><br/></p></card></wml>"
Response.end 
end if
rs("yz")=rs("yz")-num
rs("jk")=rs("jk")+num
rs.update
  rs.Close
	Set rs=Nothing
 Conn.Close
      Set Conn=Nothing
%>
存入银子成功!<br/>
---------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">我的江湖</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>