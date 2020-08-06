<%set rsnum2=Server.CreateObject("ADODB.Recordset")
rssnum2="select * from [twapp]"
rsnum2.open rssnum2,conn,1,1
sjwz=rsnum2("sjwz")
rsnum2.close   
set rsnum2=nothing
ab=1
Do While ab<=sjwz
set rs9 = server.createobject("adodb.recordset")
        sql9="select * from wjfile"
        rs9.open sql9,conn,1,1
if rs9.recordcount <= 0 then
        response.write("还没有文件！<br/>")
        else       
 randomize

sjj=int(rnd()*rs9.recordcount)+1
rs9.absoluteposition=sjj 
%>
<a href='soft_viwe.asp?id=<%=rs9("id")%>&amp;class=<%=rs9("lid")%>&amp;cid=<%=rs9("idd")%>&amp;hk=<%=hk%>'><%=UBB1(left(rs9("name"),20))%></a><br/>
<%end if
rs9.close
set rs9=nothing
ab=ab+1
Loop
%>