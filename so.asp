<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card title='站内文章搜索'>
<p>
<input emptyok="true" name="keyword" value="" title="请输入关键词"/><br/>
<select name="sear" value="1">
			<option value="1">按标题搜索</option>
			<option value="2">按内容搜索</option>
			</select><br/>
<anchor>搜索文章<go href="search.asp?hk=<%=hk%>" method="post" >
<postfield name="keyword" value="$(keyword)"/>
<postfield name="sear" value="$(sear)"/>
</go></anchor><br/>
<%
Response.write "－－－－－<br/>"
Response.write "<anchor>返回上级<prev/></anchor><br/>"
Response.write "<a href='/index.asp?hk=<%=hk%>'>返回首页</a>"
response.write "<br/></p></card></wml>"
response.end
%>