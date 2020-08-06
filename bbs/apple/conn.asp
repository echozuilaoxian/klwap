<%
dim ydzqconn
set ydzqconn=Createobject("ADODB.connection")
ydzqconn.connectionString="DBQ="& server.mappath("/bbs/apple/#apple.mdb")& ";DRIVER={Microsoft Access Driver (*.mdb)};"

ydzqconn.open

Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
Function winApple()
dim RandID,Randnum
RandID=RndNumber(1,3) 
if abs(int(RandID))=3 then '出大奖，反之出小奖
Randnum=abs(int(RndNumber(1,8))) 
if Randnum=1 then
winApple="苹果"
elseif Randnum=2 then
winApple="桔子"
elseif Randnum=3 then
winApple="芒果"
elseif Randnum=4 then
winApple="铃铛"
elseif Randnum=5 then
winApple="西瓜"
elseif Randnum=6 then
winApple="双星"
elseif Randnum=7 then
winApple="双七"
elseif Randnum=8 then
winApple="老王"
end if
else
Randnum=abs(int(RndNumber(1,8))) 
if Randnum=1 then
winApple="苹果[小]"
elseif Randnum=2 then
winApple="桔子[小]"
elseif Randnum=3 then
winApple="芒果[小]"
elseif Randnum=4 then
winApple="铃铛[小]"
elseif Randnum=5 then
winApple="西瓜[小]"
elseif Randnum=6 then
winApple="双星[小]"
elseif Randnum=7 then
winApple="双七[小]"
elseif Randnum=8 then
winApple="老王[小]"
end if
end if
End Function
Function LuApple(appletext)
dim lutype
 lutype=3
if appletext="苹果" then
 lutype=5
 elseif appletext="桔子" then
 lutype=10
 elseif appletext="芒果" then
 lutype=15
 elseif appletext="铃铛" then
 lutype=20
 elseif appletext="西瓜" then
 lutype=20
 elseif appletext="双星" then
 lutype=30
 elseif appletext="双七" then
 lutype=40
 elseif appletext="老王" then
 lutype=100
 end if
 LuApple=lutype
End Function

  Function TApple(TypeApple)
dim Atype
 Atype=""
if TypeApple="苹果" then
 Atype="pg"
 elseif TypeApple="桔子" then
 Atype="mg"
 elseif TypeApple="芒果" then
 Atype="xg"
 elseif TypeApple="铃铛" then
 Atype="mag"
 elseif TypeApple="西瓜" then
 Atype="sx"
 elseif TypeApple="双星" then
 Atype="jz"
 elseif TypeApple="双七" then
 Atype="sq"
 elseif TypeApple="老王" then
 Atype="yb"
 end if
 TApple=Atype
End Function

sub jjapple(appletext,lutype,appleID,paylu) 
dim rcent,pcent
set rcent=Server.CreateObject("ADODB.Recordset")
rcent.open"select pcent from appleadmin where id=1",ydzqconn,1,1
pcent=rcent(0)
rcent.close
set rcent=nothing

dim appletext2,lulu
lulu=1
appletext2=left(appletext,2)
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select payusid from applelist where appleid="&appleID&" and winer=0 and paytype='"&appletext2&"' group by payusid",ydzqconn,1,1
  do while not rs.eof 
  if InStr(appletext,"[小]")>0 then
  lulu=3
  else
  lulu=lutype
  end if
  dim payCi
    payCi=ydzqconn.execute("Select Count(ID) from applelist where payusid="&rs("payusid")&" and appleid="&appleID&" and winer=0 and paytype='"&appletext2&"'")(0)
    if payCi="" or IsNumeric(payCi)=False then payCi=1
  conn.execute("update usereg set usejf=usejf+"&abs(lulu*pcent*payCi-abs(lulu*pcent*payCi*(paylu/pcent)))&" where id="&rs("payusid"))
dim talk
talk="" & Session("ltname") & "在第"&appleID&"期水果机游戏中了"&payCi&"注“"&appletext&"”，赚"&abs(lulu*pcent*payCi)&getcent&"！"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  rs.movenext
  loop
  rs.close
  set rs=nothing
  '以下为更新已奖
  ydzqconn.execute("update applelist set winer=1 where appleid="&appleID&" and winer=0 and paytype='"&appletext2&"'")
End sub
Function fordateapple(riqi)
if IsDate(riqi) = True then
   fordateapple =""
  fordateapple = fordateapple&Hour(riqi)&":"
  if Minute(riqi) < 10 then
  fordateapple = fordateapple&"0"
  end if
  fordateapple = fordateapple&Minute(riqi)
end if
End Function

Function date_apple(fordatenum)
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
sub addList(typeName,myni,myid,ID,Rnum)
dim rcent,pcent
set rcent=Server.CreateObject("ADODB.Recordset")
rcent.open"select pcent from appleadmin where id=1",ydzqconn,1,1
pcent=rcent(0)
rcent.close
set rcent=nothing

for i=1 to Rnum
set rsr=Server.CreateObject("ADODB.Recordset")
  rsr.open"select  payname,payusid,paycent,paytime,appleid,paytype from applelist",ydzqconn,1,3
rsr.addnew
rsr("payname")=myni
rsr("payusid")=myid
rsr("paycent")=pcent
rsr("paytype")=typeName
rsr("paytime")=now()
rsr("appleid")=ID
rsr.update
rsr.close
set rsr=nothing
next
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