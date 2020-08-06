<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="使用宝石" ontimer="index.asp?SessionID=<%=request("SessionID")%>">
<timer value="10"/>
<p>
<!--#include file="conn.asp"-->
<%
wpid=request("wpid")
ids=session("useid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
if wpid="bs" then
tstl="2"
yname="宝石"
end if

Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有宝石！是不是忘记带眼镜啦~~"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select fs from sx where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
 rs8.Close
	Set rs8=Nothing
if fs=100000 then
msg="您的身体已经够棒了，不能再用任何药品！"
else
sql="update sx set fs=fs+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您使用了"&yname&"后,防御力提升"&tstl&""
END IF
end if
Response.Write ""&msg&"正在返回......<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>