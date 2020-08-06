<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="娱乐圈-单位排行榜" >
<p>单位光荣榜<br/>-----------
<% SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")%>

<br/><a href='zhilie.asp?SessionID=<%=SessionID%>'>+|智力排行</a>
<br/><a href='caihuae.asp?SessionID=<%=SessionID%>'>+|才华排行</a>
<br/><a href='tilie.asp?SessionID=<%=SessionID%>'>+|体力排行</a>
<br/><a href='mle.asp?SessionID=<%=SessionID%>'>+|魅力排行</a>
<br/>------------
<%
Response.write "<br/><a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a>"
%></p></card></wml>