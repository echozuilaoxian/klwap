<%set rsnum31=Server.CreateObject("ADODB.Recordset")
rssnum31="select zxtz from [twapp]"
rsnum31.open rssnum31,conn,1,1
zxtz=rsnum31("zxtz")
rsnum31.close   
set rsnum31=nothing
set brs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from bbstz where yc=0 and bbsid<>0 and bbsid<>9999 order by tm desc"
  brs.open ssql,conn,1,1
if brs.eof then 
response.write("还没有贴子！<br/>")
else
brs.Move(0)
dim t1,spmc
t1=1
do while ((not brs.EOF) and t1 <=zxtz)
    spmc=left(brs("name"),15)
   if len(brs("name"))>15 then
    spmc=spmc+".."
   End if
    Response.write "<a href='bbs/bbs_view.asp?tid=" & brs("id") & "&amp;hk="&hk&"'>" & ubb(spmc) & "</a>"
Response.write "[<a href='bbs/hf_view.asp?tid=" & brs("id") & "&amp;bbsid=" & brs("bbsid") & "&amp;hk="&hk&"'>" & brs("hfs") & "/" & brs("rc") & "</a>]<br/>"
brs.MoveNext
t1=t1+1
loop
end if
brs.close
set brs=nothing
%>


