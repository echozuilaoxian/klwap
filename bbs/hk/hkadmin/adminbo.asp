<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='博客管理' >
<p><%
db="/bbs/hk/#xh6666.cn.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.open connstr
set rs=server.createobject("adodb.recordset")
sql = "select * from wap_album_content where id order by id"
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "还没有日志!"

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
<%=i+1%>.<%=rs("title")%>[<a href='delbo.asp?id=<%=rs("id")%>'>删除</a>]<br/>
<% else %>
<%=i+1+10*(Request("page")-1)%>.<%=rs("title")%>[<a href='delbo.asp?id=<%=rs("id")%>'>删除</a>]<br/>

<%
end if
i=i+1
mp=mp-1
rs.movenext
loop

if page>rs.pagecount then Response.redirect("adminform.asp?page="&rs.pagecount)
if page>1 then
response.Write(" <a href='adminbo.asp?page="&page-1&"'>&#x4E0A;&#x4E00;&#x9875;</a> ")
end if


if page<rs.pagecount then
response.Write("<a href='adminbo.asp?page="&page+1&"'>&#x4E0B;&#x4E00;&#x9875;</a>")
end if
end if
response.Write("<br/> &#x5171;"&total&"个日志")
response.write "&#40;" & page & "&#47;" & rs.PageCount & "&#41;<br/>"
if rs.PageCount>1 then
response.write "到<input  name='page' value='4' size='5' format='*N'/>页<anchor>确定<go method='post' href='adminbo.asp'><postfield name='page' value='$(page)'/></go></anchor>>><br/>"
End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<br/>---------
<br/><%
Response.write "<a href='/bbs/hk/index0.asp?SessionID=" & SessionID & "'>返回博客</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"

%>
</p>
</card>
</wml> 