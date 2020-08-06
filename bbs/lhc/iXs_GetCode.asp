<%
set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm"
  objgbrx.open ssqlx,myc,1,1
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
objgbrs.open ssql,myc,1,3
if objgbrs.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbrs.movefirst 
randomize

For i=1 to objgbrs.recordcount
id=objgbrs("ids")
ks1=objgbrs("ks")
ks=clng(ks1*41)
hm1=objgbrs("hm")
if hm1=tms then
sql="update cpjf set usejf=usejf+'" & ks & "' where CStr(ids)='" & id & "'"
  myc.execute sql
sql="update cpjf set tmjf=tmjf+'" & ks & "' where CStr(ids)='" & id & "'"
myc.execute sql
sql="update cpjf set czjjf=czjjf+'" & ks & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【特码】开奖号码是【[b]"&tms&"[/b]号】,你买中了,你下注金额是[b]"&ks1&"港币x41倍=" & ks & "港币[/b]系统已自动给你加了[b]" & ks & "[/b]港币,请查收!这是系统信息,请勿回复!"
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
objgbr1.open ssql1,myc,1,3
if objgbr1.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr1.movefirst 
randomize

For i=1 to objgbr1.recordcount
id=objgbr1("ids")
ks2=objgbr1("ks")
ksa=clng(ks2)*5
hm2=objgbr1("hm")
if hm2=wxs then
sql="update cpjf set usejf=usejf+'" & ksa & "' where CStr(ids)='" & id & "'"
  myc.execute sql

sql="update cpjf set wxjf=wxjf+'" & ksa & "' where CStr(ids)='" & id & "'"
myc.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksa & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【五行】开奖结果是 【[b]"&wxs&"[/b]行】,你买中了,你下注金额是[b]"&ks2&"港币x5倍=" & ksa & "港币[/b]系统已自动给你加了[b]" & ksa & "[/b]港币,请查收!这是系统信息,请勿回复!"
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
objgbr2.open ssql2,myc,1,3
if objgbr2.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr2.movefirst 
randomize

For i=1 to objgbr2.recordcount
id=objgbr2("ids")
ks3=objgbr2("ks")
ksb=clng(ks3)*11
hm3=objgbr2("hm")

if hm3=sxs then
sql="update cpjf set usejf=usejf+'" & ksb & "' where CStr(ids)='" & id & "'"
  myc.execute sql

sql="update cpjf set sxjf=sxjf+'" & ksb & "' where CStr(ids)='" & id & "'"
myc.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksb & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【生肖】开奖结果是 【[b]"&sxs&"[/b]】,你买中了,你下注金额是[b]"&ks3&"港币x11倍=" & ksb & "港币[/b]系统已自动给你加了[b]" & ksb & "[/b]港币,请查收!这是系统信息,请勿回复!"
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
objgbr3.open ssql3,myc,1,3
if objgbr3.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr3.movefirst 
randomize

For i=1 to objgbr3.recordcount
id=objgbr3("ids")
ks4=objgbr3("ks")
ksc=clng(ks4)*2.6
hm4=objgbr3("hm")

if hm4=pss then
sql="update cpjf set usejf=usejf+'" & ksc & "' where CStr(ids)='" & id & "'"
  myc.execute sql

sql="update cpjf set psjf=psjf+'" & ksc & "' where CStr(ids)='" & id & "'"
myc.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksc & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【波色】开奖结果是 【[b]"&pss&"[/b]色】,你买中了,你下注金额是[b]"&ks4&"港币x2.6倍=" & ksc & "港币[/b]系统已自动给你加了[b]" & ksc & "[/b]港币,请查收!这是系统信息,请勿回复!"
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
objgbr4.open ssql4,myc,1,3
if objgbr4.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr4.movefirst 
randomize

For i=1 to objgbr4.recordcount
id=objgbr4("ids")
ks5=objgbr4("ks")
ksd=clng(ks5)*1.8
hm5=objgbr4("hm")

if hm5=dss then
sql="update cpjf set usejf=usejf+'" & ksd & "' where CStr(ids)='" & id & "'"
  myc.execute sql

sql="update cpjf set dsjf=dsjf+'" & ksd & "' where CStr(ids)='" & id & "'"
myc.execute sql

sql="update cpjf set czjjf=czjjf+'" & ksd & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【单双】开奖结果是 【[b]"&dss&"[/b]数】,你买中了,你下注金额是[b]"&ks5&"港币x1.8倍=" & ksd & "港币[/b]系统已自动给你加了[b]" & ksd & "[/b]港币,请查收!这是系统信息,请勿回复!"
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
objgbr5.open ssql5,myc,1,3
if objgbr5.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbr5.movefirst 
randomize

For i=1 to objgbr5.recordcount
id=objgbr5("ids")
ks6=objgbr5("ks")
kse=clng(ks6)*1.8
hm6=objgbr5("hm")
if hm6=dxs then
sql="update cpjf set usejf=usejf+'" & kse & "' where CStr(ids)='" & id & "'"
  myc.execute sql

sql="update cpjf set dxjf=dxjf+'" & kse & "' where CStr(ids)='" & id & "'"
myc.execute sql

sql="update cpjf set czjjf=czjjf+'" & kse & "' where CStr(ids)='" & id & "'"
myc.execute sql

ltlyuan="虚拟博彩-第"&idss&"期【大小】开奖结果是 【[b]"&dxs&"[/b]数】,你买中了,你下注金额是[b]"&ks6&"港币x1.8倍=" & kse & "港币[/b]系统已自动给你加了[b]" & kse & "[/b]港币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbr5.Movenext
  if objgbr5.EOF then Exit for
 Next
End if
objgbr5.close
Set objgbr5= Nothing
%>