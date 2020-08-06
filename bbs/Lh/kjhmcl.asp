<%
set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm"
  objgbrx.open ssqlx,conn,1,1
objgbrx.movelast
idss=objgbrx("idss")
tms=objgbrx("tm")
dss=objgbrx("ds")
dxs=objgbrx("dx")
pss=objgbrx("ps")
sxs=objgbrx("sx")
wxs=objgbrx("wx")

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from ctm where cstr(idss)='"&idss& "'"
objgbrs.open ssql,conn,1,3
if objgbrs.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbrs.movefirst 
randomize

For i=1 to objgbrs.recordcount
id=objgbrs("ids")
ks1=objgbrs("ks")
ks=objgbrs("ks")*41
hm1=objgbrs("hm")

if hm1=tms then
sql="update usereg set usejf=usejf+'" & ks & "' where CStr(id)='" & id & "'"
  conn.execute sql
sql="update cpjf set tmjf=tmjf+'" & ks & "' where CStr(ids)='" & id & "'"
conn.execute sql
sql="update cpjf set czjjf=czjjf-'" & ks & "' where CStr(ids)='1' "
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【特码】开奖号码是【[b]"&tms&"[/b]号】,你买中了,你下注金额是[b]"&ks1&"金币x41倍=" & ks & "金币[/b]系统已自动给你加了[b]" & ks & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbrs.Movenext
  if objgbrs.EOF then Exit for
 Next
End if
objgbrs.close
Set objgbrs= Nothing


set objgbr1=Server.CreateObject("ADODB.Recordset")
ssql1="select * from cwx where cstr(idss)='"&idss& "'"
objgbr1.open ssql1,conn,1,3
if objgbr1.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr1.movefirst 
randomize

For i=1 to objgbr1.recordcount
id=objgbr1("ids")
ks2=objgbr1("ks")
ksa=objgbr1("ks")*5
hm2=objgbr1("hm")
if hm2=wxs then
sql="update usereg set usejf=usejf+'" & ksa & "' where CStr(id)='" & id & "'"
  conn.execute sql

sql="update cpjf set wxjf=wxjf+'" & ksa & "' where CStr(ids)='" & id & "'"
conn.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksa & "' where CStr(ids)='" & id & "'"
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【五行】开奖结果是 【[b]"&wxs&"[/b]行】,你买中了,你下注金额是[b]"&ks2&"金币x5倍=" & ksa & "金币[/b]系统已自动给你加了[b]" & ksa & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr1.Movenext
  if objgbr1.EOF then Exit for
 Next
End if
objgbr1.close
Set objgbr1= Nothing


set objgbr2=Server.CreateObject("ADODB.Recordset")
ssql2="select * from csx where cstr(idss)='"&idss& "'"
objgbr2.open ssql2,conn,1,3
if objgbr2.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr2.movefirst 
randomize

For i=1 to objgbr2.recordcount
id=objgbr2("ids")
ks3=objgbr2("ks")
ksb=objgbr2("ks")*11
hm3=objgbr2("hm")

if hm3=sxs then
sql="update usereg set usejf=usejf+'" & ksb & "' where CStr(id)='" & id & "'"
  conn.execute sql

sql="update cpjf set sxjf=sxjf+'" & ksb & "' where CStr(ids)='" & id & "'"
conn.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksb & "' where CStr(ids)='" & id & "'"
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【生肖】开奖结果是 【[b]"&sxs&"[/b]】,你买中了,你下注金额是[b]"&ks3&"金币x11倍=" & ksb & "金币[/b]系统已自动给你加了[b]" & ksb & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr2.Movenext
  if objgbr2.EOF then Exit for
 Next
End if
objgbr2.close
Set objgbr2= Nothing


set objgbr3=Server.CreateObject("ADODB.Recordset")
ssql3="select * from cps where cstr(idss)='"&idss& "'"
objgbr3.open ssql3,conn,1,3
if objgbr3.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr3.movefirst 
randomize

For i=1 to objgbr3.recordcount
id=objgbr3("ids")
ks4=objgbr3("ks")
ksc=objgbr3("ks")*2.6
hm4=objgbr3("hm")

if hm4=pss then
sql="update usereg set usejf=usejf+'" & ksc & "' where CStr(id)='" & id & "'"
  conn.execute sql

sql="update cpjf set sxjf=sxjf+'" & ksc & "' where CStr(ids)='" & id & "'"
conn.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksc & "' where CStr(ids)='" & id & "'"
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【波色】开奖结果是 【[b]"&pss&"[/b]色】,你买中了,你下注金额是[b]"&ks4&"金币x2.6倍=" & ksc & "金币[/b]系统已自动给你加了[b]" & ksc & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr3.Movenext
  if objgbr3.EOF then Exit for
 Next
End if
objgbr3.close
Set objgbr3= Nothing


set objgbr4=Server.CreateObject("ADODB.Recordset")
ssql4="select * from cds where cstr(idss)='"&idss& "'"
objgbr4.open ssql4,conn,1,3
if objgbr4.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr4.movefirst 
randomize

For i=1 to objgbr4.recordcount
id=objgbr4("ids")
ks5=objgbr4("ks")
ksd=objgbr4("ks")*1.8
hm5=objgbr4("hm")

if hm5=dss then
sql="update usereg set usejf=usejf+'" & ksd & "' where CStr(id)='" & id & "'"
  conn.execute sql

sql="update cpjf set sxjf=sxjf+'" & ksd & "' where CStr(ids)='" & id & "'"
conn.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksd & "' where CStr(ids)='" & id & "'"
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【单双】开奖结果是 【[b]"&dss&"[/b]数】,你买中了,你下注金额是[b]"&ks5&"金币x1.8倍=" & ksd & "金币[/b]系统已自动给你加了[b]" & ksd & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr4.Movenext
  if objgbr4.EOF then Exit for
 Next
End if
objgbr4.close
Set objgbr4= Nothing


set objgbr5=Server.CreateObject("ADODB.Recordset")
ssql5="select * from cdx where cstr(idss)='"&idss& "'"
objgbr5.open ssql5,conn,1,3
if objgbr5.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr5.movefirst 
randomize

For i=1 to objgbr5.recordcount
id=objgbr5("ids")
ks6=objgbr5("ks")
kse=objgbr5("ks")*1.8
hm6=objgbr5("hm")

if hm6=dxs then
sql="update usereg set usejf=usejf+'" & kse & "' where CStr(id)='" & id & "'"
  conn.execute sql

sql="update cpjf set sxjf=sxjf+'" & kse & "' where CStr(ids)='" & id & "'"
conn.execute sql

sql="update cpjf set czjjf=czjjf+'" & kse & "' where CStr(ids)='" & id & "'"
conn.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【大小】开奖结果是 【[b]"&dxs&"[/b]数】,你买中了,你下注金额是[b]"&ks6&"金币x1.8倍=" & kse & "金币[/b]系统已自动给你加了[b]" & kse & "[/b]金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr5.Movenext
  if objgbr5.EOF then Exit for
 Next
End if
objgbr5.close
Set objgbr5= Nothing
%>