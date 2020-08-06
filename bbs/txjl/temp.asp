<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml;" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head><%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if(Session("ok")="true") then
response.redirect "/BBS/txjl/index.asp?SessionID=" & SessionID & ""
end if
dim id
dim n
dim mykey
id=request("id")
n=request("n")
mykey=request("mykey")   
Session("ok")="true"
response.redirect "/BBS/txjl/play.asp?n="&n&"&mykey="&mykey&"&SessionID="&SessionID&"&id="&id
%> 
<card id="card3" ontimer="/BBS/txjl/play.asp?n=<%=n%>&amp;mykey=<%=mykey%>&amp;id=<%=id%>&amp;SessionID=<%=SessionID%>" title="go!">    
<timer value="1"/> 
<p align='left'>
</p>
</card>
</wml>                