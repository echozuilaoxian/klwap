<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1
%>
<card title="网友留言">
<p><img src="/IMG/ly.gif" alt="网友留言"/><br/>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] order by [ID] desc"
rs.open rsstr,conn,1,2
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10					
	Dim Count,page,pagecount,gopage,parent			
	gopage="ly.asp?hk="&hk&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))
        response.write ("共:"&count&"条留言<br/>")
        response.write ("<a href=""ly_add.asp"">发表留言</a><br/>")						
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
%>
<% if rs("open")="0" then %>
<%=i+(page-1)*PageSize%>.<a href='ly_view.asp?ID=<%=rs("ID")%>&amp;p=<%=p%>&amp;hk=<%=hk%>'><%=UBB(rs("title"))%></a>(<%=rs("name")%>)
<% else %>
*<%=i+(page-1)*PageSize%>.<a href='ly_view.asp?ID=<%=rs("ID")%>&amp;p=<%=p%>&amp;hk=<%=hk%>'><%=UBB(rs("title"))%></a>(<%=rs("name")%>)
<% end if %>
<% if rs("retext")<>"" then %>[已复]<% end if%>
<br/>
<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	还没有留言!

<%end if%>
<br/><img src="/img/hr.gif" alt=""/><br/>
<a href="ly_add.asp?hk=<%=hk%>">发表留言</a><br/>
<a href="index.asp?hk=<%=hk%>">返回首页</a><br/><br/>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>