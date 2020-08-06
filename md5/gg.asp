<%dim rsgg,Aagg,legg
                  legg=2
  set rsgg=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut=999
     ssql="select id,biao from gg"
rsgg.open ssql,conn,1,1
if rsgg.eof then
   'Response.write "&#x6682;&#x65E0;&#x8BB0;&#x5F55;<br/>"
Else
Aagg=rsgg.recordcount-legg 
rsgg.move(randsub(Aagg))
for i = 1 to legg
Response.write "<a href='/md5/ggto.Asp?id=" & rsgg("id") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(rsgg("biao"))&"</a><br/>"
rsgg.movenext
	next
rsgg.close
set rsgg=nothing
end if
%>