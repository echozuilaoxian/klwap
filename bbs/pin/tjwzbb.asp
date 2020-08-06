<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<% wap=request.querystring("wap") %>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<wml><card id='card1' title='发表评论'><p>"
  Response.write "你的发表权已被锁，请联系版主。</p></card></wml>"
    response.end
End if
iduse=Session("useid")
lasttlls="179"
lasttls
conn.close
set conn=nothing
%>
<wml>
<card id="card1" title="发表评论">
<p align="left">
内容
<br/><input type="text" name="memo"/>
<br/><anchor>写好了
<go method="post" href="tjwzclbb.asp?wap=<%=wap%>">
<postfield name="memo" value="$(memo)"/>
</go>
</anchor>
<%
Response.write "<br/><a href='/bbs/anther/topao.asp?wap=" & wap & "'>网站调查</a>"
%>
</p></card></wml>



