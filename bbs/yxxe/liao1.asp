﻿<!--#include file="conn1.asp"-->
<%
set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select lt from sx where ids="&ids
rsppp.open rsstr,liao,1,2
lt=rsppp("lt")
   rsppp.close
set rsppp=Nothing%>
<%if lt=0 then%>
<%Set Rsl = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 3 id,txt,lid,tm,yc,name FROM l order by tm desc"
			Rsl.Open Sqll,liao,1,1
			if not (rsl.bof and rsl.eof)  then 
				if rsl.RecordCount>3 then
					aaaaa=3
				else
					aaaaa=rsl.RecordCount
				end if%>

-----------<br/>

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
					<a href="dfzl.asp?id=<%=rsl("lid")%>&amp;SessionID=<%=SessionID%>"><%=rsl("name")%></a>说:<%=rsl("txt")%><%  
Response.write"("
Response.write right(""&biaoti,8)
Response.write")<br/>"
%>
<%else%>
[匿]:<%=rsl("txt")%><%  
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
更多<a href='/BBS/yxxe/qliao.asp?SessionID=<%=SessionID%>'>聊天记录>></a><br/>
<input name="text<%=minute(now)%><%=second(now)%>" title="内容" type="text" format="*M" emptyok="true" maxlength="35" value=""/><br/>
是否匿名：
<select  name="yc">
<option  value="0">否</option>
<option  value="1">是</option>
</select><br/>
<anchor>快速发言<go href="/BBS/yxxe/addcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8"><postfield name="txt" value="$(text<%=minute(now)%><%=second(now)%>)"/><postfield name="yc" value="$(yc)"/><postfield name="lid" value="<%=session("useid")%>"/><postfield name="name" value="<%=session("ltname")%>"/></go></anchor>.<a href='?SessionID=<%=SessionID%>&amp;tt=<%=time%>'>刷新</a>.<a href="/BBS/yxxe/lt.asp?pp=1&amp;SessionID=<%=SessionID%>">关闭</a><br/>
<%else%>
-----------<br/>
聊天频道:[<a href="/BBS/yxxe/lt.asp?pp=0&amp;SessionID=<%=SessionID%>">开启</a>]<br/>
<%end if%>