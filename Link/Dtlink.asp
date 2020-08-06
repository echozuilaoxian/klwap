<%
'============================================================

'============================================================
%>
<%
dim Rslc,Sqlink
set Rslc=Server.CreateObject("ADODB.Recordset")
Sqlink="select [ID],[namt],[classid] from [link] Where [Active] =0 order by [time] desc"
rslc.open Sqlink,conn,1,1
if rslc.recordcount = 0 then
response.write("暂无首链！<br/>")
end If
dim aaa
aaa=1
do while ((not rslc.EOF) and aaa<=linknum)
Response.write "<a href=""/link/view.asp?sid="&sid&"&amp;class="&rslc("classid")&"&amp;id="&rslc("id")&"&amp;hk="&hk&""">"&ubb(rslc("NAMT"))&"</a> "				
if aaa mod 4 =0 and aaa<>rslc.RecordCount then 
					response.write "<br/>"
End if  
rslc.MoveNext
aaa=aaa+1
loop
%>
<%rslc.close
set rslc=nothing%>