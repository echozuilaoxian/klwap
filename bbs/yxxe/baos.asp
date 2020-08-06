<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的宝贝">
<p>
<!--#include file="conn.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?did=did"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select bs,y6 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "<img src='img/bs.gif' alt='-yxxe.net-'/><br/>宝石:(" & rs("bs") &"颗)<br/><a href='syboo.asp?wpid=bs&amp;SessionID="&SessionID&"'>应用宝石</a>|<a href='song.asp?wpid=bs&amp;SessionID="&SessionID&"'>送人</a><br/>"
Response.Write "<img src='img/hua.gif' alt='-yxxe.net-'/><br/>情人花:(" & rs("y6") &"朵)<br/><a href='qrh.asp?wpid=y6&amp;SessionID="&SessionID&"'>应用情人花</a>|<a href='song.asp?wpid=y6&amp;SessionID="&SessionID&"'>送人</a><br/>"
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>