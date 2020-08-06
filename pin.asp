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
<!--#include file="conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title='查看评论'>
<p>
<% dim ids,id,cid,pa
ids=cint(request.QueryString("class"))
id=cint(request.QueryString("id"))
cid=cint(request.QueryString("cid"))
pa=cint(request.QueryString("pa"))
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from pin where fileid="&id&" order by id desc"
rs.open rsstr,conn,1,2
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=5
							
	Dim Count,page,pagecount,gopage			
	gopage="pl.asp?id="&id&"&amp;cid="&cid&"&amp;class="&ids&"&amp;hk="&hk&"&amp;pa="&pa&"&amp;"
	Count=conn.execute("Select count(ID) from [pl] where smsid="&id&"")(0)	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
	rs.move(pagesize*(page-1))					
	For i=1 To PageSize
        						
	If rs.eof Then Exit For				
%><%=i+(page-1)*PageSize%>楼.时间:<%=rs("pltime")%><br/>内容:<%=rs("pin")%><br/>来自:<%=rs("ip")%><br/>----<br/>


<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	暂时没有评论！
<% end if
rs.close
set rs=nothing
conn.close
set conn=nothing%>
<br/>
<br/>
<a href='soft_viwe.asp?id=<%=id%>&amp;class=<%=ids%>&amp;cid=<%=cid%>&amp;pa=<%=pa%>&amp;hk=<%=hk%>'>返回</a>><a href='soft_list.asp?class=<%=ids%>&amp;cid=<%=cid%>&amp;pa=<%=pa%>&amp;hk=<%=hk%>'>栏目</a>><a href='/index.asp?hk=<%=hk%>'>首页</a>
</p>
</card>
</wml>