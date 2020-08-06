<card id="card1" title="摇摇乐">
<p align="left">
<%iduse=Session("useid")
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from fuuse where CStr(ids)='" & iduse & "'"
       rs8.open ssql,jjconn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if


sql="Delete FROM sjzk WHERE bu='game' and DATEDIFF('s', timed, now()) > 720*60*3"
conn.Execute sql
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds where hm='nno'"
objgbrs.open ssql,jjconn,1,1
if objgbrs.EOF then 
 Error("系统错误！！！<br/><a href='index.asp?SessionID=" & SessionID & "'>刷新本页</a>")
jjconn.close
Set jjconn= Nothing
  end if
if clng(objgbrs("ks"))>2000 then
id=objgbrs("id")
lzjb=objgbrs("lzjb")*0.8+80000
talkk="系统消息：(url=/bbs/game/yyl/index.asp)摇摇乐(/url)第"&objgbrs("id")+1&"期奖池累积到:"&objgbrs("lzjb")*0.8+80000&"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('0','"&talkk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
objgbrs.close
Set objgbrs= Nothing
jjconn.Execute("update ds set hm='ok' where id="&id)
dim talk
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 

talk=RndNumber(1000,2000)
sql="insert into ds(ids,hm,lzjb)values('"&talk&"','nno','"&lzjb&"')"
  Application.Lock
  jjconn.execute sql
  Application.Unlock
end if
objgbrs.close
Set objgbrs= Nothing
%>