<%set rsnum311=Server.CreateObject("ADODB.Recordset")
rssnum311="select zrtz from [twapp]"
rsnum311.open rssnum311,conn,1,1
zrtz=rsnum311("zrtz")
rsnum311.close   
set rsnum311=nothing
set brss=Server.CreateObject("ADODB.Recordset")
     ssqls="select * from bbstz where yc=0 and bbsid<>0 and bbsid<>9999 order by rc desc"
  brss.open ssqls,conn,1,1
if brss.eof then 
response.write("还没有贴子！<br/>")
else
brss.Move(0)
dim ts1,sspmc
ts1=1
do while ((not brss.EOF) and ts1 <=zrtz)
    sspmc=left(brss("name"),15)
   if len(brss("name"))>15 then
    sspmc=sspmc+".."
   End if
    Response.write "<a href='bbs/bbs_view.asp?tid=" & brss("id") & "&amp;hk="&hk&"'>" & ubb(sspmc) & "</a><br/>"
brss.MoveNext
ts1=ts1+1
loop
end if
brss.close
set brss=nothing
%>


