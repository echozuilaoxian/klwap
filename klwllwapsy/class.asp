﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="网站设计中心">
<p><img src="/IMG/1.gif" alt='设计中心'/><br/>
<a href="tjfl.asp?sid=<%=sid%>">[添加栏目]</a>
<br/>--------<br/>
<%
        set rs=server.createobject("adodb.recordset")
sql = "select * from class where parent=0 order by pid asc"
rs.open sql,conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10
	Dim Count,page,pagecount,gopage			
	gopage="class.asp?sid="&sid&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))			
	For i=1 To PageSize
        						
	If rs.eof Then Exit For			
%><a href="clist.asp?sid=<%=sid%>&amp;id=<%=rs("classid")%>&amp;lx=<%=rs("lx")%>">[管理]></a><%=rs("pid")%>.<%=ubb1(left(rs("class"),20))%><br/>
<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	暂时没有栏目！

<%
end if

rs.close
set rs=nothing
%><br/><img src="/img/hr.gif" alt=""/><br/>
<a href="lmpx.asp?sid=<%=sid%>">[栏目重排]</a><br/>
<a href="tjfl.asp?sid=<%=sid%>">[添加栏目]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
