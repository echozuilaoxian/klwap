<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="成语词典">  
<p>输入关键词:
<% wap=request.querystring("wap") %>
<br/><input name="lingname" />
<br/><anchor>查 找
<go method="post" href='fincycl.asp?wap=<%=wap%>'>
<postfield name="lingname" value="$(lingname)"/>
</go>
</anchor>
<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>服务广场</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>




