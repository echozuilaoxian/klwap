<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%Server.ScriptTimeout=999
wap=request.querystring("wap")%>
<card id="card1" title="错误!">  
<p>
请用手机开设聊天室。如果你用手机出现此页面,请联系大当家ID:1.谢谢!
<br/>
<a href='/index.asp?wap=<%=wap%>'>返回首页</a><br/>
</p>
</card>
</wml>



