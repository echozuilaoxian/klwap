<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="md5.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% Dim Rss,Sqll,s
set Rss=Server.CreateObject("ADODB.Recordset")
Sqll="select sid from [admin]"
	Rss.open Sqll,Conn,1,3
s=946545765698765465875768   
Randomize
ss=Int(Rnd()*s)
rss("sid")=md5(md5(ss,16),32)
rss.update()
%>
<card id="main" title="安全退出" ontimer="/index.asp">
<timer value="10"/><p>
安全退出后台...<br/>
<%rss.close
set rss=nothing
conn.close
set conn=nothing
%>
</p>
</card>
</wml>