<% Response.ContentType="text/vnd.wap.wml" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->  
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-申请论坛">
<p align="left">
申请论坛<br/> 
-----------<br/> 
一、申请开通论坛最低支持人数为30人(新人,以ID判断).申坛者请到"社区客服"发帖申请.注明所有支持者的呢称和ID号 <br/> 
二、申坛时需该坛内部选举一个版主. <br/> 
三、管理员审核通过后开通. <br/> 
四、所开通论坛一天如果没有3篇文章,将会在1个礼拜后撤掉,不再开通.<br/> 
---------------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>返回上级</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/>    
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>