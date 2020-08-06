<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="发布广播">
<p>
<%
id=request("id")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>
<!--#INCLUDE file="conn.asp"-->
<!--#include file="ubb.inc"-->


发布内容：<br/>
<input name="text<%=minute(now)%><%=second(now)%>" title="内容" type="text" format="*M" emptyok="true" maxlength="30" value=""/><br/>
<anchor>确定发布
    <go href="/BBS/xhgg/ggcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(text<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="yc" value="$(yc)"/>
        <postfield name="lid" value="<%=session("useid")%>"/>
        <postfield name="name" value="<%=session("ltname")%>"/>
    </go>
</anchor>
<br/>
----------<br/><b>广播每条收取100金币</b>
<br/>
----------<br/>
<a href="/bbs/xhgg/ggjl.asp?SessionID=<%=SessionID%>">广播首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>