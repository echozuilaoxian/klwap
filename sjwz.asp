<%set rsnum8=Server.CreateObject("ADODB.Recordset")
rssnum8="select * from [twapp]"
rsnum8.open rssnum8,conn,1,1
sjwz=rsnum8("sjwz")
rsnum8.close   
set rsnum8=nothing 
a=1
Do While a<=sjwz
set rs6 = server.createobject("adodb.recordset")
        sql6="select * from sms"
        rs6.open sql6,conn,1,1
if rs6.recordcount <= 0 then
        response.write("还没有文章！<br/>")
        else        
 randomize
sjj=int(rnd()*rs6.recordcount)+1
rs6.absoluteposition=sjj %>
<a href='viwe.asp?id=<%=rs6("ID")%>&amp;class=<%=rs6("classid")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs6("title"),20))%></a><br/>
<%end if
rs6.close
set rs6=nothing
a=a+1
Loop
%>