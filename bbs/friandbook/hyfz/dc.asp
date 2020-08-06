<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
wap=request.querystring("wap")
iduse=Session("useid")
 ids=request("idd")
 %>

<card id="card1" title="分组管理"><p align="left">
新组名:<input type="text" name="name" maxlength="8" size="6"/>
<br/><anchor>提交
<go method="post" href='dccl.asp?ids=<%=ids%>&amp;wap=<%=wap%>'>
<postfield name="name" value="$(name)"/>
<postfield name="id" value="<%=iduse%>"/>
</go>
</anchor><br/><a href='/bbs/friandbook/myfriend.asp?wap=<%=wap%>'>我的好友</a><br/><a href='/bbs/public/gygl.asp?wap=<%=wap%>'>我的地盘</a>-<a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a></p></card></wml>



