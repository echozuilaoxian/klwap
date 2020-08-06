<%set rsnum=Server.CreateObject("ADODB.Recordset")
rssnum="select * from [twapp]"
rsnum.open rssnum,conn,1,1
zxwz=rsnum("zxwz")
rsnum.close   
set rsnum=nothing
set rs5 = server.createobject("adodb.recordset")
        sql5="select id,test,title,classid,hit from sms order by id desc"
        rs5.open sql5,conn,1,1
If rs5.eof Then 
response.write("还没有文章呀！<br/>")
else
rs5.Move(0)
dim g
g=1
do while ((not rs5.EOF) and g <=zxwz)%>
<a href='viwe.asp?id=<%=rs5("ID")%>&amp;class=<%=rs5("classid")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs5("title"),20))%></a><br/>
<%
rs5.MoveNext
g=g+1
loop
end if
rs5.close
set rs5=nothing
%>