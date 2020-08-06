<!--#include file="conn1.asp"-->
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
					<a href="dfzl.asp?id=<%=rsl("lid")%>&amp;SessionID=<%=SessionID%>"><%=rsl("name")%></a>说:<%=rsl("txt")%><br/>
<%else%>
                                        [匿名]说:<%=rsl("txt")%><br/>
<%end if%>

				<%Rsl.MoveNext
				Next
			end if
			Rsl.close
			set rsl=nothing
                         liao.close
			set liao=nothing%>
<input name="text<%=minute(now)%><%=second(now)%>" title="内容" type="text" format="*M" emptyok="true" maxlength="38" value=""/><br/>
<anchor>快速发言
    <go href="addcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(text<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="yc" value="$(yc)"/>
        <postfield name="lid" value="<%=session("useid")%>"/>
        <postfield name="name" value="<%=session("ltname")%>"/>
    </go>
</anchor><a href='qliao.asp?SessionID=<%=SessionID%>'>记录</a><br/>[<a href="lt.asp?pp=1&amp;SessionID=<%=SessionID%>">关闭</a>聊天频道]<br/>-----------<br/>
<%else%>
[<a href="lt.asp?pp=0&amp;SessionID=<%=SessionID%>">开启</a>聊天频道]<br/>
-----------<br/>
<%end if%>