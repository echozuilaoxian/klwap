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
p=cint(request("p"))
if p="" or p<1 then p=1
%>

<card title="最新加入">
<p>
<!--#include file="aaa.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where check=1 order by [id] desc"
rs.open rsstr,conn,1,2

set rsc=Server.CreateObject("ADODB.Recordset")
rsstrc="select * from [urls] where check=0"
rsc.open rsstrc,conn,1,2

maxpage=int((rs.recordcount-1)/pag)+1
if p>maxpage then p=maxpage

if rs.recordcount > 0 or rsc.recordcount > 0 then

%>

<%
   if rsc.recordcount > 0 then
response.write(rsc.recordcount & "个<a href='check.asp?myid=" & myid & "&amp;idss=" & idss & "&amp;CD=" & CD & "'>待审</a>案件<br/><br/>")
   end if


if rs.recordcount = 0 then response.write("暂无案件！<br/>")
if rs.recordcount > 0 then
rs.Move((p-1)*pag)
dim j
j=1

do while ((not rs.EOF) and j<=clng(pag))
%>
<%=((p-1)*pag+j)%>.<a href='view.asp?SessionID=<%=SessionID%>&amp;idss=<%=idss%>&amp;CD=<%=CD%>&amp;ids=<%=rs("idd")%>&amp;p=<%=p%>&amp;id=<%=rs("id")%>'><%=ubb(rs("title"))%></a><br/>
<%
rs.MoveNext
j=j+1
loop
end if
response.write("共" & rs.recordcount & "个,第" & p & "/" & (int((rs.recordcount-1)/pag)+1) & "页<br/>")
end if

if p*pag<rs.recordcount then response.write("<a href='new.asp?SessionID=" & SessionID & "&amp;idss=" & idss & "&amp;CD=" & CD & "&amp;p=" & p+1 & "'>[下页]</a>&nbsp;")
if p>1 then response.write("<a href='new.asp?SessionID=" & SessionID & "&amp;idss=" & idss & "&amp;CD=" & CD & "&amp;p=" & p-1 & "'>[上页]</a>&nbsp;")
%>
<%if p*pag<rs.recordcount or p>1 then%>
<br/><input name="page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if p>=maxpage then response.write(p-1) else response.write(p+1)%>"/>
<anchor>[跳转页面]
    <go href="new.asp?SessionID=<%=SessionID%>&amp;idss=<%=idss%>&amp;CD=<%=CD%>" accept-charset='utf-8'>
        <postfield name="p" value="$(page<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%end if%>
-----------<br/>
<a href='all.asp?SessionID=<%=SessionID%>&amp;idss=<%=idss%>&amp;CD=<%=CD%>'>热门排行</a><br/>
<a href='search.asp?SessionID=<%=SessionID%>&amp;idss=<%=idss%>&amp;CD=<%=CD%>'>搜索网站</a><br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
rsc.close
set rsc=nothing
conn.close
set conn=nothing
%>