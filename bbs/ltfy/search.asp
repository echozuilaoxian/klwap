<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="案件搜索">
<p align='left'>
<%
SessionID=request("SessionID")
%>
搜索内容：<br/>
<input name="findch" title="搜索内容" maxlength="20"/><br/>
搜索条件：<br/>
<select title="搜索条件" name="sear" value="title">
<option title="site" value="title">被告人昵称</option>
<option title="url" value="url">起诉人ID</option>
</select><br/>
<anchor>[-搜索-]<go href="searchok.asp?SessionID=<%=SessionID%>
" method='post' accept-charset='utf-8'>
<postfield name='sear' value='$(sear)'/>
<postfield name='search' value='$(findch)'/>
</go></anchor><br/>
<%
Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/>"
%>
</p>
</card>
</wml>