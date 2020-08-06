<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="clsThief.asp" -->
<%
Response.ContentType="text/vnd.wap.wml;charset=utf-8"	'将文件的格式转换成wml，编码为UTF-8
dim keyword,myThief,pageValue,regEx
keyword=request.Form("keyword")
dim sid
sid=request.querystring("sid")
if(keyword<>"")	then
	set myThief=new clsThief 
	myThief.src="http://www.dheart.net/sfz/?num="& UCase(keyword) &""
	myThief.steal("gb2312")	'开始偷窃
	myThief.cut "查询结果</b></center><br>","</td></tr></table><br>","|对不起，您输入的身份证号码有错误|请确定是否书写错误。然后重新查询！|" '按指定首尾字符串对偷取的内容进行裁减（不包括首尾字符串）
	pageValue=Replace(Replace(myThief.value,chr(13),""),chr(10),"")	'将处理过后的内容传给变量pageValue
	set myThief=nothing
	
	pageValue=Replace(pageValue,"<br>","|")
	'//下面是使用正则表达式，批量替换“<>”标签内的内容为空
	Set regEx=new RegExp		
	regEx.pattern="<.+?>" 
	regEx.IgnoreCase =false 
	regEx.Global=True 
	pageValue=regEx.Replace(pageValue,"")
	
	pageValue=Replace(Replace(pageValue,"|","<br/>"),"&nbsp;","")

%>
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
	<wml>
	<head>
	<meta http-equiv="Cache-Control" content="max-age=0"/>
	<meta http-equiv="Cache-Control" content="no-cache"/>
	</head>
	<card id="IDCardSearchResult" title="身份证属地">
	<p align="left">
	
<%
response.write pageValue
%>
<br/>---------<br/>
请输入身份证号：<br/>
<input name="keyword" emptyok="true" type="text"/><br/>
<anchor>马上查询<go href="Result.asp?sid=<%=sid%>" method="post">
<postfield name="keyword" value="$(keyword:n)" />
</go></anchor><br/>
提示：身份证号码为15或18位，如果第18位为X，请用大写字母。<br/>
----------<br/><a href="index.asp?sid=<%=sid%>">返回上一级</a><br/>

<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>
<%
end if
%>
