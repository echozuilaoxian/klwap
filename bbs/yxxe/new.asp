<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<!--#include file="conn.asp"-->
<%
wap=request("wap")
aaa=request("aaa")
ids=session("useid")
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from "&aaa&" where cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
if rs1.recordcount<1 then
rs1.addnew
rs1("ids")=ids
rs1.update
end if
rs1.close
set rs1=Nothing
Conn.close
set Conn=nothing


Response.Write("<card title='好彩花园' ontimer='index.asp?wap="&wap&"'>")
Response.Write("<timer value='3'/><p>")
Response.Write("系统已成功为您开垦了新花园！并送你10颗种子,赶快去种花吧!<br/>--------------<br/>正在返回您的花园...")
Response.Write("<br/>--------------<br/>")
Response.Write("<a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>")
%>
</p>
</card>
</wml>