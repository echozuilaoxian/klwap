<%set rsnum1=Server.CreateObject("ADODB.Recordset")
rssnum1="select * from [twapp]"
rsnum1.open rssnum1,conn,1,1
zrwz=rsnum1("zrwz")
rsnum1.close   
set rsnum1=nothing
   set rs7 = server.createobject("adodb.recordset")
        sql7="select id,test,title,hit,classid from sms order by hit desc"
        rs7.open sql7,conn,1,1
If rs7.eof Then 
response.write("还没有文章呀！<br/>")
else
rs7.Move(0)
dim gf
gf=1
do while ((not rs7.EOF) and gf <=zrwz)%>
<a href='viwe.asp?id=<%=rs7("ID")%>&amp;class=<%=rs7("classid")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs7("title"),20))%></a><br/>
<%
rs7.MoveNext
gf=gf+1
loop
end if
rs7.close
set rs7=nothing
%>