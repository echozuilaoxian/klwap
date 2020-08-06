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
ForumID=request("ForumID")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<card id="card1" title="<%=dlname%>-捐款金币">
<p align="left">
输入金币数量
<br/><input type="text" name="zb" value="100" format="*N" maxlength="8"/>
<br/><anchor>[-提交-]
<go method="post" href='22.asp?SessionID=<%=SessionID%>'>
<postfield name="zb" value="$(zb)"/>
<postfield name='ForumID' value='<%=ForumID %>'/>
</go>
</anchor>
<%
Response.write "<br/>------------<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a></p></card></wml>"%>