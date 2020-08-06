<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="情人花应用">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

ids=session("useid")
Response.Write "情人花可自由加属性<br/>情人花使用后属性点+2<br/>请选择要加的属性：<br/><a href='syqra.asp?wpid=y6&amp;SessionID="&SessionID&"'>加攻击</a><br/><a href='syqrb.asp?wpid=y6&amp;SessionID="&SessionID&"'>加防御</a>"
%>
<br/>--------<br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>