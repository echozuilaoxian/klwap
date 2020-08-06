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
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
    End if
ids=session("useid")
%>
<!--#INCLUDE VIRTUAL="/bbs/yxxe/usejf.asp"-->
<%
ids=session("useid")
%>
您有金币<%=usejf%>,与银子的汇率为10:1,即100金币能换10两银子,但最多可以用1000000金币兑换100000两银子(不限次数)<br/>
<!--#include file="conn.asp"-->
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from jfpost where cstr(ids)="&session("useid")
rs.open strsQL,Conn
if rs.eof then
msg="0"
else
msg=rs("usejf")
end if
%><br/>
您已兑换银子<%=msg%>两,最多能兑换银子<%=(100000-msg)%>两(合<%=((100000-msg)*10)%>金币).<br/>
<br/>请问您要用多少金币兑换银子呢?<br/>
你说:我要用<input name="num" size="3" format="*N" value="0" />
<br/><anchor>金币兑换<go method="post" href="zhyzcl.asp?SessionID=<%=SessionID%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
---------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>
<%
  rs.Close
	Set rs=Nothing
 Conn.Close
      Set Conn=Nothing
%>