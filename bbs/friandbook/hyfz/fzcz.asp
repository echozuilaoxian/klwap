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
SessionID=request.querystring("SessionID")
iduse=Session("useid")
 %>
<card id="card1" title="创建新的分组"><p align="left">
组名:<input type="text" name="zuname" maxlength="8" size="20"/>
<br/>排序:<input type="text" name="memo"  format='*N' maxlength="10" size="20"/>
<br/><anchor>[-提交-]
<go method="post" href='fzczcl.asp?SessionID=<%=SessionID%>'>
<postfield name="zuname" value="$(zuname)"/>
<postfield name="memo" value="$(memo)"/>
<postfield name="id" value="<%=iduse%>"/>
</go>
</anchor>
<br/>
注:排序越小越靠前<br/>------------<br/>

<a href='/bbs/friandbook/hyfz/add8.asp?SessionID=<%=SessionID%>'>返回分组管理</a><br/>
<a href='/bbs/friandbook/myfriend.asp?SessionID=<%=SessionID%>'>返回默认分组</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>



