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

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&ForumID
rse.open rspple,conn,1,2
if rse.eof then
dlname="无此帮派"
else
dlname=converttowidebaiti(rse("biaoti"))
yxxes=rse("tjhm")
end if
rse.close
Set rse= Nothing
%>
<card id="card1" title="<%=dlname%>-捐款金币">
<p align="left">
输入金币数量
<br/><input type="text" name="zb" value="100" format="*N" maxlength="6"/>
<br/><anchor>[-提交-]
<go method="post" href='1003.asp?SessionID=<%=SessionID%>'>
<postfield name="zb" value="$(zb)"/>
<postfield name='ForumID' value='<%=ForumID %>'/>
</go>
</anchor>
<%
Response.write "<br/>------------<br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a><br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a></p></card></wml>"%>