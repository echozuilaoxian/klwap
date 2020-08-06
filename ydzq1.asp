<%
hk=request("hk")
yy=Month(now)&"" '月
rr=Day(now)&"" '日
if len(rr)=1 then rr="0"&rr 
hh=hour(now)&"" '时
if len(hh)=1 then hh="0"&hh
mm=minute(now)&"" '分
if len(mm)=1 then mm="0"&mm
ttvv="" & yy & "" & rr &"" & hh &"" & mm &""
dim zhhp,sqsl
set zhhp=Server.CreateObject("ADODB.Recordset")
sqsl="select * from Users where grsb='"&hk&"'"
zhhp.open sqsl,conn,1,1
if zhhp.eof then
myid="0"
myni="登录/注册"
ltmybz="0"
ltmybz1="0"
myxcy="0"
mycjbz="0"
lll="15"
ssbb="500"
hfxs="3"
Else
if zhhp("grzt")=2 then response.redirect "login.asp?cw=out"
ffbbid=zhhp("id")
myid=zhhp("id")
xuan=zhhp("xuan")
grni=zhhp("nini")
myni=zhhp("nini")
myjb=zhhp("myjb")
ltmybz=zhhp("gllt")
ltmybz1=zhhp("gllt1")
myxcy=zhhp("ltxcy")
mycjbz=zhhp("ltzj")
myjf=zhhp("myjf")
lll=zhhp("lll")
tjj=zhhp("tjj")
ssbb=zhhp("ssbb")
hfxs=zhhp("hfxs")
ftsj=zhhp("ftsj")
hfsj=zhhp("hfsj")
endleibie=zhhp("endleibie")
end if
zhhp.close
set zhhp=nothing
'更新在线时间
dim DiffEnd
DiffEnd = 100
if tjj <> "" then
  DiffEnd = DateDiff("s", tjj, NOW())
else
  tjj = (Now() - 1)
end if

IF DiffEnd >= 50 THEN
  sql="update Users set tjj=now() Where id=" & myid & ""
  conn.Execute(sql)
END IF
%>


