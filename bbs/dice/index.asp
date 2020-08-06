<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%dim dicename,hello,paysmall,paybig,payds,payss,paybz,dicetime,dicetimes,paylu
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select dicename,hello,paysmall,paybig,payds,payss,paybz,dicetimes,paylu from diceadmin where id=1",ydzqconn,1,1
if not rs.eof then
dicename=rs(0)
hello=rs(1)
paysmall=rs(2)
paybig=rs(3)
payds=rs(4)
payss=rs(5)
paybz=rs(6)
dicetimes=rs(7)
paylu=rs(8)
end if
rs.close
set rs=nothing%>
<%
response.write "<card title="""&dicename&""">"
response.write "<p>"
response.write"<img src='logo.gif' alt=''/><br/>欢迎您:<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>"&myni&"</a>您有"&myjb&getcent&"!<br/>"&chr(13)
response.write ubb(hello)&"<br/>"

response.write "-----------<br/>"
dim diceID
  diceID=0
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select top 1 ID,dicesmall,dicebig,diceds,dicess,dicebz,dicetime from dice order by id desc",ydzqconn,1,1
if not rs.eof then
diceID=rs(0)
dicesmall=rs(1)
dicebig=rs(2)
diceds=rs(3)
dicess=rs(4)
dicebz=rs(5)
dicetime=rs(6)
end if
rs.close
set rs=nothing
if dicetime<=Now() then
  Application.Lock
dim id1,id2,id3
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
ID1=RndNumber(1,6)
ID2=RndNumber(1,6)
ID3=RndNumber(1,6)
dim newTimee,hsnum
newTimee = DateAdd("n", dicetimes, Now())
hsnum=abs(int(ID1+ID2+ID3))
ydzqconn.execute("update dice set dice1="&ID1&",dice2="&ID2&",dice3="&ID3&",comeover=1,hs="&hsnum&"  where ID="&diceID)
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select * from dicelist where diceid="&diceID&" and winer=0 order by id desc",ydzqconn,1,1
  do while not rs.eof 
  if rs("paytype")=1 then
  if SEdice(ID1,ID2,ID3,1)="小" then
  ydzqconn.execute("update dicelist set winer=1 where id="&rs("ID"))
  conn.execute("update usereg set usejf=usejf+"&abs(paysmall*rs("paycent")-(paysmall*rs("paycent")*(paylu/100)))&" where ID="&rs("payusid"))
dim talk
talk="" & Session("ltname") & "在第"&diceID&"期幸运彩球中了小，赚"&abs(paysmall*rs("paycent"))&getcent&"!"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  end if
  elseif rs("paytype")=2 then
  if SEdice(ID1,ID2,ID3,2)="大" then
  ydzqconn.execute("update dicelist set winer=1 where id="&rs("ID"))
  conn.execute("update usereg set usejf=usejf+"&abs(paybig*rs("paycent")-abs(paybig*rs("paycent")*(paylu/100)))&" where ID="&rs("payusid"))
talk="" & Session("ltname") & "在第"&diceID&"期幸运彩球中了大，赚"&abs(paysmall*rs("paycent"))&getcent&"!"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  end if
  elseif rs("paytype")=3 then
  if SEdice(ID1,ID2,ID3,3)="单" then
  ydzqconn.execute("update dicelist set winer=1 where id="&rs("ID"))
  conn.execute("update usereg set usejf=usejf+"&abs(payds*rs("paycent")-abs(payds*rs("paycent")*(paylu/100)))&" where ID="&rs("payusid"))
talk="" & Session("ltname") & "在第"&diceID&"期幸运彩球中了单，赚"&abs(paysmall*rs("paycent"))&getcent&"!"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  end if
  elseif rs("paytype")=4 then
  if SEdice(ID1,ID2,ID3,4)="双" then
  ydzqconn.execute("update dicelist set winer=1 where id="&rs("ID"))
  conn.execute("update usereg set usejf=usejf+"&abs(payss*rs("paycent")-abs(payss*rs("paycent")*(paylu/100)))&" where ID="&rs("payusid"))
talk="" & Session("ltname") & "在第"&diceID&"期幸运彩球中了双，赚"&abs(paysmall*rs("paycent"))&getcent&"!"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  end if
  elseif rs("paytype")=5 then
  if rs("hs")=hsnum then
  ydzqconn.execute("update dicelist set winer=1 where id="&rs("ID"))
  conn.execute("update usereg set usejf=usejf+"&abs(paybz*rs("paycent")-abs(paybz*rs("paycent")*(paylu/100)))&" where ID="&rs("payusid"))
talk="" & Session("ltname") & "在第"&diceID&"期幸运彩球中了合数，赚"&abs(paysmall*rs("paycent"))&getcent&"!"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  end if
  end if
  rs.movenext
  loop
  rs.close
  set rs=nothing
  ydzqconn.execute("update dicelist set comeover=1 where diceID="&diceID)
ydzqconn.execute("insert into dice(dicetime)  values('"&newTimee&"')")

  Application.Unlock
end if
if DateDiff("s", Now(), dicetime)<=10 then
response.write"开奖中……,各位买定离手咯!<a href=""index.asp?SessionID=" & SessionID &"&amp;num="&int(timer())&""">刷新</a><br/>"
else
response.write date_dice(dicetime)&"开奖了,各位赶快下啦!<a href=""index.asp?SessionID=" & SessionID &"&amp;num="&int(timer())&""">刷新</a><br/>"
end if
response.write"目前买小"&dicesmall&getcent&"<br/>"
response.write"目前买大"&dicebig&getcent&"<br/>"
response.write"目前买单"&diceds&getcent&"<br/>"
response.write"目前买双"&dicess&getcent&"<br/>"
response.write"目前买合数"&dicebz&getcent&"<br/>"
response.write"小(1赔"&paysmall&")<a href=""dice.asp?ID="&diceID&"&amp;paytype=1&amp;SessionID=" & SessionID &"&amp;num="&int(timer())&""">压"&getcent&"</a><br/>"
response.write"大(1赔"&paybig&")<a href=""dice.asp?ID="&diceID&"&amp;paytype=2&amp;SessionID=" & SessionID &"&amp;num="&int(timer())&""">压"&getcent&"</a><br/>"
response.write"单(1赔"&payds&")<a href=""dice.asp?ID="&diceID&"&amp;paytype=3&amp;SessionID=" & SessionID &"&amp;num="&int(timer())&""">压"&getcent&"</a><br/>"
response.write"双(1赔"&payss&")<a href=""dice.asp?ID="&diceID&"&amp;paytype=4&amp;SessionID=" & SessionID &"&amp;num="&int(timer())&""">压"&getcent&"</a><br/>"
response.write"合数(1赔"&paybz&")<a href=""dice.asp?ID="&diceID&"&amp;paytype=5&amp;SessionID=" & SessionID &"&amp;num="&int(timer())&""">压"&getcent&"</a><br/>"

  dim dodicecount
  set rs=ydzqconn.execute("Select sum(paycent) as dicecount from dicelist where winer=1 and diceid="&abs(diceID-1))
  if not rs.eof then
  dodicecount=rs("dicecount")
  end if
  rs.close
  set rs=nothing
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select dice1,dice2,dice3 from dice Where ID="&abs(diceID-1),ydzqconn,1,1
if not rs.eof then
response.write"第"&abs(diceID-1)&"期开"&rs("dice1")&rs("dice2")&rs("dice3")&""&SEdice2(rs("dice1"),rs("dice2"),rs("dice3"))&""
response.write"<br/><img src=""pic/"&rs("dice1")&".gif"" alt=""""/><img src=""pic/"&rs("dice2")&".gif"" alt=""""/><img src=""pic/"&rs("dice3")&".gif"" alt=""""/>"
end if
rs.close
set rs=nothing

  Response.write "<br/>--------------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<%
response.write"<br/><a href=""dicelist.asp?SessionID=" & SessionID &""">历史查询</a>|"
response.write"<a href=""dicemylist.asp?SessionID=" & SessionID &""">我的投注</a>"
response.write"<br/><a href=""dicehelp.asp?SessionID=" & SessionID &""">幸运彩球游戏规则</a>"
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
Response.write "<br/>--------------"
if Session("useid")="1" then
response.write"<br/><a href=""diceset.asp?SessionID=" & SessionID &""">管理员操作</a>"
end if
Response.write "<br/><a href=""/bbs/index.asp?SessionID=" & SessionID &""">社区首页</a><br/>"
Response.write "<a href=""/index.asp?SessionID=" & SessionID &""">网站首页</a><br/>"
Response.write "</p></card></wml>"
%>