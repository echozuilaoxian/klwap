<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% SessionID=request.querystring("SessionID") %>
<card id="card1" title="第一步-证据补充"><p align="left">第一步-证据补充<br/>--------------<br/>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
id=request.QueryString("id")
ids=request.QueryString("ids")
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1
%>
内容:<input type="text" name="memo" size="6"/><br/>
<anchor>确定补充<go method="post" href="wzjscl.asp?SessionID=<%=SessionID%>&amp;p=<%=p%>"><postfield name="memo" value="(补充)$(memo)"/><postfield name="id" value="<% =id %>"/><postfield name="ids" value="<% =ids %>"/><postfield name="check" value="0"/></go></anchor>
<br/><a href="index.asp?SessionID=<%=SessionID%>">法院</a>-<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>注：上诉收取300金币，并且只能上诉3次
</p></card></wml>



