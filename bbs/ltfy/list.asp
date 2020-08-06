<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
ids=request("ids")
p=cint(request("p"))
if p="" or p<1 then p=1

set rsn=Server.CreateObject("ADODB.Recordset")
rsstrn="select * from [class] where [id]=" & ids
rsn.open rsstrn,conn,1,2
%>

<card title='<%=rsn("title")%>'>
<p><%=rsn("title")%><br/>------------<br/>
<!--#include file="aaa.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where idd=" & ids & " and check=1 order by [id] desc"
rs.open rsstr,conn,1,2

set rsc=Server.CreateObject("ADODB.Recordset")
rsstrc="select id from [urls] where check=0"
rsc.open rsstrc,conn,1,2

if rs.recordcount = 0 and rsc.recordcount = 0 then 
response.write("暂无案件！<br/>")
else
maxpage=int((rs.recordcount-1)/pag)+1
if p>maxpage then p=maxpage




   if rs.recordcount > 0 then
rs.Move((p-1)*pag)
dim j
j=1

do while ((not rs.EOF) and j<=clng(pag))
%>

<%=((p-1)*pag+j)%>.<a href='view.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=rs("id")%>&amp;p=<%=p%>'><%=ubb(rs("title"))%></a><br/>
<%
rs.MoveNext
j=j+1
loop
   end if

end if
if rs.recordcount > 0 or rsc.recordcount > 0 then response.write("共" & rs.recordcount & "个,第" & p & "/" & (int((rs.recordcount-1)/pag)+1) & "页<br/>")

	if p*pag<rs.recordcount then response.write("<a href='list.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;p=" & p+1 & "'>[下页]</a>&nbsp;")
	if p>1 then response.write("<a href='list.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;p=" & p-1 & "'>[上页]</a>&nbsp;")
	if p*pag<rs.recordcount or p>1 then response.write("<br/>")
%>

   <% if p*pag<rs.recordcount or p>1 then %>
<input name="page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if p>=maxpage then response.write(p-1) else response.write(p+1)%>"/>
<anchor>[跳转]
    <go href="list.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>" accept-charset='utf-8'>
        <postfield name="p" value="$(page<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
   <% end if %>
---------<br/>
<!--#include file="aa.asp"-->
<!--#include file="aaaa.asp"-->
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>