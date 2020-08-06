<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<% dim rs,sql,add,rss,sqll
add=request.Querystring("class")
Set rss=Server.CreateObject("ADODB.Recordset")
sqll="Select * from [linkclass] where classid="&add
rss.open sqll,conn,1,1 
if not rss.eof then
classname=rss("class")
end if
call rssClose()%>
<card title="<%=classname%>"><p> 
<%Response.write "=" &classname&"网站=<br/>"%>
<%Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from [link] where classid="&add&" And [Active] =0  order by time desc"
rs.open sql,conn,1,1 
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=15						
	Dim Count,page,pagecount,gopage			
	gopage="list.asp?class="&ADD&"&amp;hk="&hk&"&amp;"
	Count=conn.execute("Select count(ID) from [link] where classid="&add&"")(0)	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))					
	For i=1 To PageSize     						
	If rs.eof Then Exit For				
Response.write "<a href=""view.asp?class="&rs("classid")&"&amp;id="&rs("id")&"&amp;hk="&hk&""">"&usb(rs("name"))&"</a><br/>"     
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a><br/>"
Else
%>
	暂时没有友链！<br/>
<%end if%>
<img src="hr.gif" alt=""/><br/>
<%call lasts()%><%call ALLClose()%>      