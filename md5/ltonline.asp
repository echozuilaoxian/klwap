<%
Server.ScriptTimeout=999
call sqlonline()
onliner=onliners()
sub sqlonline()
dim statuserid1
	sql="select id,ip,startime from SoftDown_online where id="& Session("useid")
	set rs=conn.execute(sql)
	idss=Session("useid")
	name=Session("ltname")
	if rs.eof and rs.bof then
		sql="insert into SoftDown_online(ids,name,id,ip,startime,lastimebk) values ("
		sql=sql & sqlstr(idss) & ","
		sql=sql & sqlstr(name) & ","
		sql=sql & sqlstr(Session("useid")) & ","
		sql=sql & sqlstr(Request.ServerVariables("REMOTE_HOST")) & ","
		sql=sql & sqlstr(now()) & ","
		sql=sql & sqlstr(now()) & ")"
   	conn.execute(sql)
   	entconts
	else
babaa=datediff("s",rs("startime"), now())
if babaa>1800 then
entconts
sql="update SoftDown_online set startime=now() where id="& Session("useid")
    Application.Lock
	conn.execute(sql)
    Application.Unlock
end if
		sql="update SoftDown_online set lastimebk=now(),ids=" & sqlstr(idss) & ",name=" & sqlstr(name) & " where id="& Session("useid")
    Application.Lock
	conn.execute(sql)
    Application.Unlock
	end if
set rs=nothing
on error resume next
Application.Lock
sql="Delete from SoftDown_online where DATEDIFF('s', lastimebk, now()) >720*60"
conn.Execute sql
Application.Unlock
lasttimer
End sub
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","''") & "'"
End function
function onliners()
	sql="Select count(id) from SoftDown_online where Cstr(name)<>'&#x6E38;&#x5BA2;'"
set tmprs=conn.execute(sql) 
onliners=tmprs(0) 
set tmprs=nothing 
if isnull(online) then onliners=0
end function
Function lasttimer()
    ids=CStr(Session("useid"))
    sql="update usereg set lasttime=now() where CStr(id)=" & ids
    Application.Lock
	conn.execute(sql)
    Application.Unlock
End Function
Function entconts()
    ids=CStr(Session("useid"))
    sql="update usereg set entcont=entcont+1 where CStr(id)=" & ids
    Application.Lock
	conn.execute(sql)
    Application.Unlock
	sql="update cw set cwzs=cwzs+1 where CStr(ids)=" & ids
    Application.Lock
	conn.execute(sql)
    Application.Unlock
End Function
%>
