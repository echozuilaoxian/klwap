<%
dim ydzqconn
set ydzqconn=Createobject("ADODB.connection")
ydzqconn.connectionString="DBQ="& server.mappath("/bbs/dice/#dice.mdb")& ";DRIVER={Microsoft Access Driver (*.mdb)};"
ydzqconn.open
Function date_dice(fordatenum)
Dim aa,bb,cc,dd,ee,ff,gg 
aa=DateDiff("s",now(),fordatenum) 
bb=Int(aa/86400) 
cc=aa-bb*86400 
dd=Int(cc/3600)
ee=cc-dd*3600 
ff=Int(ee/60)
gg=ee-ff*60 
Response.write "还有" 
if bb>0 or dd>0 or ff>0 then Response.write ff&"分" 
if bb>0 or dd>0 or ff>0 or gg>0 then Response.write gg&"秒" 
end Function

function SEdice(str1,str2,str3,strtype)
dim str,strtxt
strtxt=""
str=abs(int(str1+str2+str3))
dim dicesmall,dicebig,diceds,dicess,dicebz
dicesmall="4,5,6,7,8,9,10" '小
dicebig="11,12,13,14,15,16,17" '大
diceds="5,7,9,11,13,15,17" '单
dicess="4,6,8,10,12,14,16" '双
strtype=abs(strtype)
if strtype=1 then
if Instr(","&dicesmall&",",","&str&",") > 0 then strtxt="小"
elseif strtype=2 then
if Instr(","&dicebig&",",","&str&",") > 0 then strtxt="大"
elseif strtype=3 then
if Instr(","&diceds&",",","&str&",") > 0 then strtxt="单"
elseif strtype=4 then
if Instr(","&dicess&",",","&str&",") > 0 then strtxt="双"
elseif strtype=5 then
strtxt="合"&abs(int(str1+str2+str3))
end if
SEdice=strtxt
end function

function SEdice2(str1,str2,str3)
dim str,strtxt
strtxt=""
str=abs(int(str1+str2+str3))
dim dicesmall,dicebig,diceds,dicess,dicebz
dicesmall="4,5,6,7,8,9,10" '小
dicebig="11,12,13,14,15,16,17" '大
diceds="5,7,9,11,13,15,17" '单
dicess="4,6,8,10,12,14,16" '双
if Instr(","&dicesmall&",",","&str&",") > 0 then strtxt="小"
if Instr(","&dicebig&",",","&str&",") > 0 then strtxt=strtxt&"大"
if Instr(","&diceds&",",","&str&",") > 0 then strtxt=strtxt&"单"
if Instr(","&dicess&",",","&str&",") > 0 then strtxt=strtxt&"双"
strtxt=strtxt&"/合"&abs(int(str1+str2+str3))
SEdice2=strtxt
end function
'发信
sub ToMsg(userid,ltlyuan)
set rsu=Server.CreateObject("ADODB.Recordset")
rsu.open"select * from guest",conn,1,2
rsu.addnew
rsu("fnr")=ltlyuan
rsu("sid")=userid
rsu("fid")=0
rsu.update
rsu.close
set rsu=nothing
end sub
myid=Session("useid")
getcent="金币"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
 set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usejf from [usereg] where [id]=" &myid & " "
  rs1.open ssql1,conn
myjb=rs1("usejf")
 rs1.close
set  rs1=nothing
myni=Session("ltname")
iduse=Session("useid")
listnum=10
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
%>