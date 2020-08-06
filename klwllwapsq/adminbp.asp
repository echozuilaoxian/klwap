<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='帮派管理' >
<p>
<%
set rs=server.createobject("adodb.recordset")
sql = "select * from jzbl where id order by id"
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "还没有帮派!"

else
Page=Int(Abs(Request("page")))
IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then page=1
rs.pagesize = 10 '每页显示记录数
total = rs.RecordCount
mp = rs.pagesize
rs.absolutepage = page
i=0:k=0

do while not rs.eof and mp>0:k=k+1
%>
<%
if Request("page")="" then %>
<%=i+1%>.<%=rs("biaoti")%>[<a href='adminbpxg.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>'>修改</a>][<a href='adminbpdel.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=rs("id")%>'>删除</a>]<br/>
<% else %>
<%=i+1+10*(Request("page")-1)%>.<%=rs("biaoti")%>[<a href='adminbpxg.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>'>修改</a>][<a href='adminbpdel.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>'>删除</a>]<br/>

<%
end if
i=i+1
mp=mp-1
rs.movenext
loop

if page>rs.pagecount then Response.redirect("adminltgform.asp?page="&rs.pagecount)
if page>1 then
response.Write(" <a href='adminbp.asp?page="&page-1&"&amp;adminmid="&request("adminmid")&"'>&#x4E0A;&#x4E00;&#x9875;</a> ")
end if


if page<rs.pagecount then
response.Write("<a href='adminbp.asp?page="&page+1&"&amp;adminmid="&request("adminmid")&"'>&#x4E0B;&#x4E00;&#x9875;</a>")
end if
end if
response.Write("<br/> &#x5171;"&total&"个帮派")
response.write "&#40;" & page & "&#47;" & rs.PageCount & "&#41;<br/>"
if rs.PageCount>1 then
response.write "到<input  name='page' value='4' size='5' format='*N'/>页<anchor>确定<go method='post' href='adminbp.asp?adminmid="&request("adminmid")&"'><postfield name='page' value='$(page)'/></go></anchor><br/>"
End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<br/>------------<br/>
<anchor>返回上级<prev/></anchor>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a>
</p>
</card>
</wml>