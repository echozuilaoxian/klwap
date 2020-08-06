<!--#include file="Head.asp"-->
<!--#include file="Config.asp"-->
<%
Dim Rss,Sqll
set Rss=Server.CreateObject("ADODB.Recordset")
Sqll="select * from [link_admin]"
	Rss.open Sqll,Conn,1,1
%>
<card id="index" title="<%=rss("title")%>">
<p><img src="<%=rss("logo")%>" alt="logo"/>
<%call rssClose()%><br/>
<%
dim Rs,Sql
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select [ID],[name],[classid] from [link] Where [Active] =0 order by [time] desc"
rs.open Sql,conn,1,1
If Not rs.eof	Then
Dim PageSize,i
	PageSize=10							
	Dim Count,page,pagecount,gopage	
	gopage="index.asp?hk="&hk&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1    
	pagecount=(count+pagesize-1)\pagesize
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))
        response.write ("IP记录,刷量必删<br/>")				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
Response.write "<a href=""view.asp?class="&rs("classid")&"&amp;id="&rs("id")&"&amp;hk="&hk&""">"&usb(rs("name"))&"</a><br/>" 
	rs.moveNext 								
	Next	
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	暂时没有友链！
<%end if%>
<%Call rsClose()%>
<br/><img src="/IMG/fl.gif" alt="分类浏览"/><br/>
<%
set rs = server.createobject("adodb.recordset")
	sql="select * from linkclass order by pid asc"
	rs.open sql,conn,1,1
if not (rs.bof and rs.eof)  then 
For i=1 to rs.RecordCount    '完全循环下去
If Rs.Eof Then
exit For
End If
if rs("br")="1" then '换行标识
br="<br/>"
else
br=""
end if
Response.write "<a href=""list.asp?class="&rs("classid")&"&amp;hk="&hk&""">"&usb(rs("class"))&"</a> "& br &"" 
Rs.MoveNext
Next
end if
%>
-----------<br/>
<a href='links_good.asp?hk=<%=hk%>'>优秀网站</a> <a href='Active.asp?hk=<%=hk%>'>待审</a> <a href='Add.asp?hk=<%=hk%>'>申链</a><br/><a href="/index.asp?hk=<%=hk%>">返回网站首页</a></p></card></wml>
<%call ALLClose()%>
