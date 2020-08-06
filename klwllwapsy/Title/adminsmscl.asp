<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%dim rs1,sql1,id
id= int(request.QueryString("id"))
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="Select * from wzclass where classid="&id
rs1.open sql1,conn,1,1 
if not rs1.eof then
classname=rs1("class")
end if
rs1.close
set rs1=nothing
%>
<card title="<%=classname%>"><p>
<%
dim rs,sql
response.write ("<a href='add.asp?sid="&sid&"&amp;id="&id&"'>[添加文章]</a><br/><a href='upfile.asp?sid="&sid&"&amp;id="&id&"'>[2.0传文章]</a><br/>")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from sms where classid="&id&" order by id desc"
rs.open sql,conn,1,1
 If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10							
	Dim Count,page,pagecount,gopage			
	gopage="adminsmscl.asp?sid="&sid&"&amp;ID="&ID&"&amp;"
	Count=rs.recordcount
page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize
        if page>pagecount then page=pagecount		
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize      			
			
	If rs.eof Then Exit For				
%>[<a href="wzgl.asp?sid=<%=sid%>&amp;id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>">管理</a>]<%=i+(page-1)*PageSize%>.<a href="edits.asp?sid=<%=sid%>&amp;id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>"><%=ubb1(left(rs("title"),20))%></a><br/>
<%     
	rs.moveNext 								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	暂时没有文章！

<%
end if

rs.close
set rs=nothing
%><br/>-----------<br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>