<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<card title='优秀网站'><p>
==优秀网站==<br/>
<%Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from [link] order by [in] desc"
rs.open sql,conn,1,1 
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=15						
	Dim Count,page,pagecount,gopage			
	gopage="links_good.asp?sid="&sid&"&amp;"
	Count=conn.execute("Select count(ID) from [link]")(0)	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))					
	For i=1 To PageSize     						
	If rs.eof Then Exit For				
Response.write "<a href=""Showlink.asp?sid="&sid&"&amp;class="&rs("classid")&"&amp;id="&rs("id")&""">"&usb(rs("name"))&"</a><br/>"     
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a><br/>"
Else
%>
	暂时没有友链！<br/>
<%end if%>
<br/><img src="/img/hr.gif" alt=""/><br/><a href="Link_class.asp?sid=<%=sid%>">[分类管理]</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>
<%call ALLClose()%>  