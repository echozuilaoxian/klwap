<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
gfdsa=Session("ltname")
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

    Response.write "<card id='card1' title='"&dlname&"-奖励会员'><p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
End if 
if Session("useid")=yxxes then
%>
输入金额:<input type="text" name="zbs" value="10" format="*N" maxlength="7" size="8"/>
<br/>输入ＩＤ:<input type="text" name="id" format="*N" maxlength="15" size="8"/>
<br/><anchor>[-提交-]
<go method="post" href="1005.asp?SessionID=<%=SessionID%>">
<postfield name="zbs" value="$(zbs)"/>
<postfield name="id" value="$(id)"/>
<postfield name="ForumID" value="<%=ForumID%>"/>
</go></anchor>
<%
Response.write "<br/>----------<br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a><br/></p></card></wml>"
end if
%>