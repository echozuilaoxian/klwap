
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->

<%
 Response.write "<card  title=""水果机历史记录""><p>"
response.write"<a href=""index.asp?SessionID="&SessionID&""">返回投注</a><br/>"
response.write"=前10期开奖记录=<br/>"
set rs=Server.CreateObject("ADODB.Recordset")
rsppl="select TOP 10 id,appletext  from apple where comeover=1 order by id desc"
rs.open rsppl,ydzqconn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10					
	Dim Count,page,pagecount,gopage			
	gopage="applelist.asp?SessionID="&SessionID&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For
Response.write ""&rs("ID")&"期开奖结果为:"&rs("appletext")&"<br/>"


	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">跳转</a><br/>"
Else
   Response.write "暂无相关记录！<br/>"
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>