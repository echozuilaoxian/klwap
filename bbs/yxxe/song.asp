<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="赠送物品">  
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
wpid=request("wpid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<anchor><prev/>返回</anchor><br/>
请输入您要赠送的ID号码和数量:<br/>
ID号码：<br/><input name="useid" size="5" format="*N"/><br/>
赠送数量：<br/>
<input name="wnum" size="5" format="*N"/><br/>
<anchor>[-确定-]
<go method="post" href="songcl.asp?wpid=<%=wpid%>&amp;SessionID=<%=SessionID%>">
<postfield name="useid" value="$(useid)"/>
<postfield name="wnum" value="$(wnum)"/>
</go></anchor><br/>
==========<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>


