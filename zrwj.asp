<%set rsnum4=Server.CreateObject("ADODB.Recordset")
rssnum4="select * from [twapp]"
rsnum4.open rssnum4,conn,1,1
zrwj=rsnum4("zrwj")
rsnum4.close   
set rsnum4=nothing
set rs4 = server.createobject("adodb.recordset")
        sql4="select id,lid,name,idd from wjfile order by hit desc"
        rs4.open sql4,conn,1,1
if rs4.eof then 
response.write("还没有文件呀！<br/>")
else
rs4.Move(0)
dim gr
gr=1
do while ((not rs4.EOF) and gr <=zrwj)%>
<a href='soft_viwe.asp?id=<%=rs4("id")%>&amp;class=<%=rs4("lid")%>&amp;cid=<%=rs4("idd")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs4("name"),20))%></a><br/>
<%
rs4.MoveNext
gr=gr+1
loop
end if
rs4.close
set rs4=nothing
%>