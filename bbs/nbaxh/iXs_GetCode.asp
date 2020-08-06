<%id=request("id")
set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm where cstr(id)='"&id& "'"
  objgbrx.open ssqlx,myc,1,1
objgbrx.movelast
idss=objgbrx("idss")
tms=objgbrx("tm")
dss=objgbrx("ds")
dxs=objgbrx("dx")
pss=objgbrx("ps")
ps=objgbrx("ps")
jss=objgbrx("jss")

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from ctm where cstr(idss)='"&id& "'"
objgbrs.open ssql,myc,1,3
if objgbrs.EOF then 
'response.write "错误还没有人下注<br/>"
else
objgbrs.movefirst 
randomize

For i=1 to objgbrs.recordcount
id1=objgbrs("ids")
ks1=objgbrs("ks")
ks=clng(ks1*jss)
hm1=objgbrs("hm")
if hm1=ps then
sql="update cpjf set usejf=usejf+'" & ks & "' where CStr(ids)='" & id1 & "'"
  myc.execute sql
sql="update cpjf set tmjf=tmjf+'" & ks & "' where CStr(ids)='" & id1 & "'"
myc.execute sql
sql="update cpjf set czjjf=czjjf+'" & ks & "' where CStr(ids)='" & id1 & "'"
myc.execute sql
if ps=1 then
cl=dss
else
cl=dxs
end if 
ltlyuan="虚拟球赛-第"&id&"期胜利的是【[b]"&cl&"[/b]】,你买中了,你下注金额是[b]"&ks1&"球币x" &jss & "倍=" & ks & "球币[/b]系统已自动给你加了[b]" & ks & "[/b]球币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbrs.Movenext
  if objgbrs.EOF then Exit for
 Next
End if
objgbrs.close
Set objgbrs= Nothing

%>