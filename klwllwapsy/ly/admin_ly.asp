<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1
%>
<card title="留言管理">
<p align="left"><img src="/IMG/8.gif" alt='留言管理'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] order by [ID] desc"
rs.open rsstr,conn,1,2

maxpage=int((rs.recordcount-1)/10)+1
if p>maxpage then p=maxpage

if rs.recordcount = 0 then response.write("暂无留言！<br/>")
if rs.recordcount > 0 then
response.write("共" & rs.recordcount & "条留言<br/>")
rs.Move((p-1)*10)
dim j
j=1
response.write("----------<br/>")
if p*10<rs.recordcount then response.write("<a href='Admin_ly.asp?sid="&sid&"&amp;p=" & p+1 & "'>下页</a>&nbsp;")
if p>1 then response.write("<a href='Admin_ly.asp?sid="&sid&"&amp;p=" & p-1 & "'>上页</a>&nbsp;")
if p*10<rs.recordcount or p>1 then response.write("(" & p & "/" & (int((rs.recordcount-1)/10)+1) & ")<br/>")
do while ((not rs.EOF) and j<=10)
%>
<% if rs("open")="0" then %>
<%=((p-1)*10+j)%>.<a href='Admin_lyview.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>'><%=UBB(rs("title"))%></a><% if rs("retext")<>"" then %>[已复]<% end if%><br/><a href="readd.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[回复]</a>
<a href="del_ly.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[删除]</a><a href="edit.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[编辑]</a>
<% else %>
*<%=((p-1)*10+j)%>.<a href='Admin_lyview.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>'><%=UBB(rs("title"))%></a><% if rs("retext")<>"" then %>[已复]<% end if%><br/><a href="readd.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[回复]</a>
<a href="del_ly.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[删除]</a><a href="edit.asp?sid=<%=sid%>&amp;ID=<%=rs("ID")%>&amp;p=<%=p%>">[编辑]</a>
<% end if %>
<br/>
<%
rs.MoveNext
j=j+1
loop
end if

if p*10<rs.recordcount then response.write("<a href='Admin_ly.asp?sid="&sid&"&amp;p=" & p+1 & "'>下页</a>&nbsp;")
if p>1 then response.write("<a href='Admin_ly.asp?sid="&sid&"&amp;p=" & p-1 & "'>上页</a>")
if p*10<rs.recordcount or p>1 then response.write("<br/><b>" & p & "</b>/" & (int((rs.recordcount-1)/10)+1) & "页")%><%if p*10<rs.recordcount or p>1 then%><input name="page" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if p>=maxpage then response.write(p-1) else response.write(p+1)%>"/><anchor>>>
    <go href="Admin_ly.asp?sid=<%=sid%>" accept-charset='utf-8'>
        <postfield name="p" value="$(page)"/>
    </go>
</anchor><br/>
<%end if%>
----------<br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>