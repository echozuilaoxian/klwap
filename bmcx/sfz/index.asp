<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.ContentType="text/vnd.wap.wml;charset=utf-8"	'将文件的格式转换成wml，编码为UTF-8
dim strRnd
strRnd=minute(time)&second(time)
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<%dim sid
sid=request.querystring("sid")
%>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card id="WapIDCard" title="身份证查询">
<p align="left">
身份证属地查询<br/>
---------<br/>
请输入身份证号：<br/>
<input name="keyword<%=strRnd%>" emptyok="true" type="text"/><br/>
<anchor>马上查询<go href="Result.asp?sid=<%=sid%>" method="post">
<postfield name="keyword" value="$(keyword<%=strRnd%>:n)" />
<postfield name="Method" value="POST" />
</go></anchor><br/>
提示：身份证号码为15或18位，如果第18位为X，请用大写字母。<br/>
---------<br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>