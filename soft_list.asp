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
<!-- #include file="conn.asp" -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
add=request.QueryString("class")
cid=request.QueryString("cid")
p=request.QueryString("p")
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="Select * from wjlist where lid="&add
rs1.open sql1,conn,1,1 
if not rs1.eof then
classname=rs1("name")
end if
%>
<card title="<%=classname%>"><p>  
<%dim class1,rs,sql
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from wjfile where lid="&add&" order by id desc"
rs.open sql,conn,1,1 
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10
	Dim Count,page,pagecount,gopage			
	gopage="soft_list.asp?class="&add&"&amp;cid="&cid&"&amp;hk="&hk&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize
        						
	If rs.eof Then Exit For				
%><%=i+(page-1)*PageSize%>.<a href='soft_viwe.asp?id=<%=rs("ID")%>&amp;class=<%=add%>&amp;cid=<%=cid%>&amp;pa=<%=page%>&amp;hk=<%=hk%>'><%=UBB1(rs("name"))%></a><br/>
<%     
	rs.moveNext
						
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a><br/>"
Else
%>
	暂时没有文件！<br/>

<%
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>－－－－－<br/>
<%if p<>"" then %>
<a href='soft.asp?cid=<%=cid%>&amp;p=<%=p%>&amp;hk=<%=hk%>'>栏目列表</a><br/>
<%end if%>
<a href='soft.asp?cid=<%=cid%>&amp;hk=<%=hk%>'>栏目首页</a>><a href='index.asp?hk=<%=hk%>'>首页</a>
</p>
</card>
</wml>                           