<%set rsnum3=Server.CreateObject("ADODB.Recordset")
rssnum3="select * from [twapp]"
rsnum3.open rssnum3,conn,1,1
zxwj=rsnum3("zxwj")
rsnum3.close   
set rsnum3=nothing
set rs8 = server.createobject("adodb.recordset")
        sql8="select id,lid,name,idd from wjfile order by id desc"
        rs8.open sql8,conn,1,1
if rs8.eof then 
response.write("还没有文件呀！<br/>")
else
rs8.Move(0)
dim t
t=1
do while ((not rs8.EOF) and t <=zxwj)%>
<a href='soft_viwe.asp?id=<%=rs8("id")%>&amp;class=<%=rs8("lid")%>&amp;cid=<%=rs8("idd")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs8("name"),20))%></a><br/>
<%
rs8.MoveNext
t=t+1
loop
end if
rs8.close
set rs8=nothing
%>


