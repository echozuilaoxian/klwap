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
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-经验说明">
<p align="left">
经验说明<br/> 
 <%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
-----------<br/> 
一、[社区]会员每1小时访问社区一次增加1点经验，每发表一篇文章增加5点经验. <br/> 
二、星星和月亮级别的：经验每增加100点时将会升级.级别就会改变. <br/> 
三、6个月亮要升1个太阳时需1000点经验，之后每1000点升一级，多一颗星和月亮。<br/> 
---------------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>返回上级</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/>    
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>