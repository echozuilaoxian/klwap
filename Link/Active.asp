<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<card title='待审网站'><p>
==待审网站==<br/>
<%Set rs = Server.CreateObject("ADODB.Recordset")
Sql="select [name] from [link] Where [Active] =1 order by [id] desc"
rs.open Sql,conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=15						
	Dim Count,page,pagecount,gopage			
	gopage="links_good.asp?"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))					
	For i=1 To PageSize     						
	If rs.eof Then Exit For				
Response.write ""&usb(rs("name"))&"<br/>"      
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a><br/>"
Else
%>
	没有待审网站！<br/>
<%end if%>
<img src="hr.gif" alt=""/><br/>
<%call lasts()%><%call ALLClose()%>  