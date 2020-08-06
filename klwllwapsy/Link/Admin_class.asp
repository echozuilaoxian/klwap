<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<card title="友链管理"><p>
<%
dim Rs,Sql,idd
idd=Request.Querystring("id")
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select * from [link] Where classid="&idd&" order by time desc"
rs.open Sql,conn,1,1
If Not rs.eof	Then
Dim PageSize,i
	PageSize=10							
	Dim Count,page,pagecount,gopage	
	gopage="Admin_class.asp?sid="&sid&"&amp;id="&idd&"&amp;"
	Count=conn.execute("Select count(ID) from [link] where classid="&idd&"")(0)
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))
        response.write ("共:"&count&"条友链<br/>")				
	For i=1 To PageSize       						
	If rs.eof Then Exit For	
        Response.write "<a href=""Showlink.asp?sid="&sid&"&amp;class="&rs("classid")&"&amp;id="&rs("id")&""">"&usb(rs("name"))&"</a>|"
Response.write "<a href='Edit_link.asp?sid="&sid&"&amp;class="&rs("classid")&"&amp;id="&rs("id")&"'>编辑</a>|"
Response.write "<a href='DEL_link.asp?sid="&sid&"&amp;class="&rs("classid")&"&amp;id="&rs("id")&"'>删除</a><br/>"

	rs.moveNext 								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a><br/>"
Else
Response.write ("该分类暂时没有友链！<br/>")
end if%>
<a href="Link_class.asp?sid=<%=sid%>">[分类管理]</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>
<%call ALLClose()%>