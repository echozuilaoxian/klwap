<%set rsnum81=Server.CreateObject("ADODB.Recordset")
rssnum81="select sjtz from [twapp]"
rsnum81.open rssnum81,conn,1,1
sjtz=rsnum81("sjtz")
rsnum81.close   
set rsnum81=nothing 
aaaaa=1
Do While aaaaa<=sjtz
set rs66=Server.CreateObject("ADODB.Recordset")
     ssqlss="select * from bbstz where yc=0 and bbsid<>0 and bbsid<>9999"
  rs66.open ssqlss,conn,1,1
if rs66.recordcount <= 0 then
        response.write("还没有贴子！<br/>")
        else       
 randomize
sjj=int(rnd()*rs66.recordcount)+1
rs66.absoluteposition=sjj
dim spmcc
    spmcc=left(rs66("name"),15)
   if len(rs66("name"))>15 then
    spmcc=spmcc+".."
   End if
Response.write "<a href='bbs/bbs_view.asp?tid=" & rs66("id") & "&amp;hk="&hk&"'>" & ubb(spmcc) & "</a><br/>"
end if
rs66.close
set rs66=nothing
aaaaa=aaaaa+1
Loop
%>