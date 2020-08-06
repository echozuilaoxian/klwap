<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="发布消息">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?iipp=iipp"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<!--#INCLUDE file="conn.asp"-->
发布内容：<br/>
<input name="text<%=minute(now)%><%=second(now)%>" title="内容" type="text" format="*M" emptyok="true" maxlength="26" value=""/><br/>
是否匿名：<br/>
<select  name="yc">
<option  value="0">否</option>
<option  value="1">是</option>
</select><br/>
<anchor>确定发布
    <go href="/BBS/yxxe/addcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(text<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="yc" value="$(yc)"/>
        <postfield name="lid" value="<%=session("useid")%>"/>
        <postfield name="name" value="<%=session("ltname")%>"/>
    </go>
</anchor><br/>
----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>