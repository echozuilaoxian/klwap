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
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn.asp" -->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="最新加入文章">  
<p>
<%
        set rs = server.createobject("adodb.recordset")
        sql="select id,test,title,classid from sms order by id desc"
        rs.open sql,conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10
							
	Dim Count,page,pagecount,gopage			
	gopage="new.asp?class="&class1&"&amp;hk="&hk&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize
        						
	If rs.eof Then Exit For				
%><%=i+(page-1)*PageSize%>.<a href='viwe.asp?id=<%=rs("ID")%>&amp;class=<%=rs("classid")%>&amp;hk=<%=hk%>'><%=UBB1(rs("title"))%></a><br/>

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
%><br/>－－－－－<br/>
<a href='add.asp?hk=<%=hk%>'>上传文章</a>
<br/>
<anchor>返回上级<prev/></anchor>
<br/><a href='index.asp?hk=<%=hk%>'>返回首页</a>
</p>
</card>
</wml>                          