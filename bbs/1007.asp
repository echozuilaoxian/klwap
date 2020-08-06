<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
 <head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="编辑帮派" >
<p>
<%
SessionID=request.querystring("SessionID")
id=request("id")
txt=request("txt")
txt2=request("txt2")
logo=request("logo")
name=request("name")
aaa=request("aaa")
Systemdj=request("Systemdj")
SessionID=request.querystring("SessionID")
set rss=Server.CreateObject("ADODB.Recordset")
rspl="select * from jzbl where id="&ID
rss.open rspl,conn,1,2
dlname=converttowidebaiti(rss("biaoti"))
yxxes=rss("tjhm")


if Session("useid")=yxxes then

 if id="" or txt2="" or name="" then
     response.write "简介不能为空！请返回</p></card></wml>"
     response.end
  End if

set rs=Server.CreateObject("ADODB.Recordset")
rspsl="select * from [jzbl] where id="&id
rs.open rspsl,conn,1,2
rs("lzdname")=Systemdj
if txt2<>"" then rs("nai")=txt2
if logo<>"" then rs("itid")=logo
if txt<>"" then rs("naiyo")=txt
if aaa<>"" then rs("a")=aaa
if name<>"" then rs("biaoti")=name

rs.update
'---关闭数据----

%>
编辑成功
<% 
end if
    Response.Write "<br/>-------------<br/>"
response.write "<a href='/bbs/djcs.asp?ID=" & ID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
<% 
rss.close
set rss=nothing

rs.close
set rs=nothing%>
</p></card></wml>