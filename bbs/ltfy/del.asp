<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="ccnn.inc"-->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
id=request.QueryString("id")
p=request.QueryString("p")
idid=request.QueryString("idid")
%>
<card title="删除案件">
<p align="left">
<%if id<>"" then%>
删除后不可恢复，你确定删除？<br/><br/>
<a href="delok.asp?SessionID=<%=SessionID%>&amp;idid=<%=idid%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">[-确定-]</a><br/><a href="view.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">[-取消-]</a>
<%else%>
<%response.redirect"index.asp"%>
<% 
end if
end if
conn.close
set conn=nothing
%>
<br/>
</p>
</card>
</wml>