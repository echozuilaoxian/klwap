<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='道具管理' >
<p>
<%
dim rs,id
id=Cstr(request("id"))
Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "select * from dj where id order by id"
rs.open sql,conn,1,1

Page=Int(Abs(Request("page")))
IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then page=1
rs.pagesize = 10 '每页显示记录数
total = rs.RecordCount
mp = rs.pagesize
rs.absolutepage = page
i=0:k=0
response.Write("道具名称/库存/价格<br/>")
do while not rs.eof and mp>0:k=k+1
%>
<%
if Request("page")="" then %>
<%=i+1%>.<%=rs("title")%>/<%=rs("sun")%>/<%=rs("jg")%>[<a href='xhitdj.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=rs("id")%>'>修改</a>][<a href='xhadmindjqx.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=rs("id")%>'>详细</a>]<br/>
<% else %>
<%=i+1+10*(Request("page")-1)%>.<%=rs("title")%>/<%=rs("sun")%>/<%=rs("jg")%>[<a href='xhitdj.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=rs("id")%>'>修改</a>][<a href='xhadmindjqx.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=rs("id")%>'>详细</a>]<br/>

<%
end if
i=i+1
mp=mp-1
rs.movenext
loop

if page>rs.pagecount then Response.redirect("adminhy.asp?page="&rs.pagecount)
if page>1 then
response.Write(" <a href='xhadmindj.asp?page="&page-1&"&amp;adminmid="&request("adminmid")&"'>&#x4E0A;&#x4E00;&#x9875;</a> ")
end if


if page<rs.pagecount then
response.Write("<a href='xhadmindj.asp?page="&page+1&"&amp;adminmid="&request("adminmid")&"'>&#x4E0B;&#x4E00;&#x9875;</a>")
end if
response.Write("<br/> &#x5171;"&total&"个道具")
response.write "&#40;" & page & "&#47;" & rs.PageCount & "&#41;<br/>"
if rs.PageCount>1 then
response.write "到<input  name='page' value='4' size='5' format='*N'/>页<anchor>确定<go method='post' href='xhadmindj.asp?t="&t&"&amp;word="&word&"&amp;adminmid="&request("adminmid")&"'><postfield name='page' value='$(page)'/></go></anchor>>><br/>"
End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
------------
<br/><a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>