<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<%
id=request.QueryString("id")
pass=request("pass1")
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="阅读留言">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & ID
rs.open rsstr,conn,1,2

set rsn=Server.CreateObject("ADODB.Recordset")
rsstrn="select * from [gbook] where [ID]<"& ID &" order by [ID] desc"
rsn.open rsstrn,conn,1,2
set rspr=Server.CreateObject("ADODB.Recordset")
rsstrpr="select * from [gbook] where [ID]>"& ID &" order by [ID] asc"
rspr.open rsstrpr,conn,1,2

if rs.recordcount=0 then
response.write("无此留言！<br/>")
else
if rs("open")=1 then
response.write("(悄悄话)" & UBB(rs("title")) & "<br/>")
else
response.write(UBB(rs("title")) & "<br/>")
end if
response.write("----------<br/>" )
response.write("<img src='/img/face/" & rs("face") & ".gif' alt=''/>" & "<br/>")
if rs("open")=0 or rs("num")=pass then
response.write(UBB(rs("text")) & "<br/>")
else 
response.write("悄悄话,输入密码可见！<br/>")
response.write("<input name='pass1' type='password' maxlength='50' /><br/>")
		response.write("<a href='ly_view.asp?ID=" & ID & "&amp;page=" & page & "&amp;pass1=$(pass1)'>查看内容</a><br/>")
end if
%>
作者：<%=rs("name")%> <br/>      
<%
response.write("时间：" & rs("time") & "<br/>")
response.write "----------<br/>"
%>
<% 
if rs("retext")<>"" then
if rs("open")=0 or rs("num")=pass then
%>
回复：<%=UBB(rs("retext"))%><br/>
<% else %>
回复：<% response.write("悄悄话回复,仅留言者本人可见！<br/>")
 %>
<% end if %>
时间：<%=rs("retime")%><br/>
----------<br/>
<% end if%>

<%if rsn.recordcount>0 then response.write("<a href='ly_view.asp?id=" & rsn("ID") & "&amp;p=" & p & "&amp;hk="&hk&"'>下条</a>&nbsp;")%>
<%if rspr.recordcount>0 then response.write("<a href='ly_view.asp?id=" & rspr("ID") & "&amp;p=" & p & "&amp;hk="&hk&"'>上条</a>&nbsp;")%>
<%if rsn.recordcount>0 or rspr.recordcount>0 then response.write("<br/>")%>


----------<br/>

<%end if%>
<a href="ly.asp?p=<%=p%>&amp;hk=<%=hk%>">返回上一级</a><br/>
<a href="/index.asp?hk=<%=hk%>">网站首页</a><br/>
</p>
</card>
</wml> 
<%
conn.close
set conn=nothing
%>