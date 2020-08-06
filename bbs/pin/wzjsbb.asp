<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% wap=request.querystring("wap") %>
<card id="card1" title="续写"><p align="left">
<%
iduse=Session("useid")
lasttlls="142"
lasttls
dim page,lendu,itid
lendu=request("lendu")
itid=request("itid")
page=request("page")
id=request("id")
conn.close
set conn=nothing
%>
前面已发表<% =lendu %>个字符<br/>续写内容<br/><input type="text" name="memo"/><br/>
<anchor>写好了<go method="post" href="wzjsclbb.asp?wap=<%=wap%>"><postfield name="memo" value="$(memo)"/><postfield name="id" value="<% =id %>"/><postfield name="page" value="<% =page %>"/><postfield name="itid" value="<% =itid %>"/></go></anchor>
<br/><a href="zcwwbb.asp?itid=<% =itid %>&amp;wap=<%=wap%>">返回主题首页</a>
</p></card></wml>



