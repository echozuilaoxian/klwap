<!--#include file="conn1.asp"-->
<!--#include file="ubb.inc"-->
<%
set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select lt from sx where ids="&ids
rsppp.open rsstr,liao,1,2
lt=rsppp("lt")
   rsppp.close
set rsppp=Nothing%>
<%if lt=0 then%>
<br/>
<%Set Rsl = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 2 id,txt,lid,tm,yc,name FROM l order by tm desc"
			Rsl.Open Sqll,liao,1,1
			if not (rsl.bof and rsl.eof)  then 
				if rsl.RecordCount>3 then
					aaaaa=3
				else
					aaaaa=rsl.RecordCount
				end if%>



				<%For i=1 to aaaaa
					If Rsl.Eof Then
						exit For
					end if%>

<%    
biaoti=left(rsl("tm"),30)
if len(rsl("tm"))>30 then
biaoti=biaoti
end if
%>
<%if rsl("yc")=0 then%>
					<img src="/bbs/xhgg/gg.gif" alt="" /><a href="/bbs/reg/useinfo.asp?id=<%=rsl("lid")%>&amp;SessionID=<%=SessionID%>"><%=rsl("name")%></a>说:<%=rsl("txt")%><%  
Response.write"("
Response.write right(""&biaoti,8)
Response.write")<br/>"
%>

<%end if%>

				<%Rsl.MoveNext
				Next
			end if
			Rsl.close
			set rsl=nothing
                         liao.close
			set liao=nothing%>
更多<a href='/BBS/xhgg/ggjl.asp?SessionID=<%=SessionID%>'>广播记录>></a><br/>-----------<br/>

<%end if%>