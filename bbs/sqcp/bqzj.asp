<%
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from sqcp "
objgbrs.open ssql,conn,1,3
if objgbrs.EOF then 
'response.write "错误！！！<br/>还没有人买彩票,你白开的奖!<br/>"
'response.write "<br/><a href='/bbs/sqcp/sqcp.asp?SessionID=" & SessionID & "'>[彩票中心]</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a></p></card></wml>"
'response.end
'end if

else
objgbrs.movefirst

times=objgbrs("time")
kjtimes=times+10*0.0004
kjtime=DateDiff("s",now(),kjtimes)
if kjtime>1 then
'Response.write "本期开始时间:<br/> "&time&"<br/>开奖时间: <br/>"&kjtimes&"<br/>开奖倒计时:"&kjtime&"秒<br/>现在时间:<br/>"&now&"<br/>嗯!本期还没结束,抓紧时间吧!<br/><a href='/bbs/sqcp/txhm.asp?SessionID=" & SessionID & "'>购买彩票</a>"
Else 
id=objgbrs("ids")
randomize

zjhm=int(rnd*90000)+10000
set objgbrx=Server.CreateObject("ADODB.Recordset")
sql="insert into zjhm(zjhm) values ("
sql=sql & sqlstr(zjhm) & ")"
  conn.execute sql
application.unlock

set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from zjhm "
  objgbrx.open ssqlx,conn,1,1
objgbrx.movelast
idss=objgbrx("idss")
hm1=right(zjhm,1)
hm2=right(zjhm,2)
hm3=right(zjhm,3)
hm4=right(zjhm,4)
hm5=right(zjhm,5)

For i=1 to objgbrs.recordcount
hms=objgbrs("hm")
hms1=right(hms,1)
hms2=right(hms,2)
hms3=right(hms,3)
hms4=right(hms,4)
hms5=right(hms,5)

if hms1=hm1 then
sql="update usereg set usejf=usejf+90,cpjf=cpjf+90 where CStr(id)='" & id & "'"
  conn.execute sql
ltlyuan="你在第"&idss&"期购买的彩票中了四等奖,系统已自动给你加了90金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

if hms2=hm2 then
sql="update usereg set usejf=usejf+3000,cpjf=cpjf+3000 where CStr(id)='" & id & "'"
  conn.execute sql
ltlyuan="你在第"&idss&"期购买的彩票中了三等奖,系统已自动给你加了3000金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

if hms3=hm3 then
sql="update usereg set usejf=usejf+30000,cpjf=cpjf+30000 where CStr(id)='" & id & "'"
conn.execute sql
ltlyuan="你在第"&idss&"期购买的彩票中了二等奖,系统已自动给你加了30000金币,请查收!这是系统信息,请勿回复!"
gftz()
end if

if hms4=hm4 then
sql="update usereg set usejf=usejf+300000,cpjf=cpjf+300000 where CStr(id)='" & id & "'"
  conn.execute sql
ltlyuan="你在第"&idss&"期购买的彩票中了一等奖,系统已自动给你加了300000金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

if hms5=hm5 then
sql="update usereg set usejf=usejf+3000000,cpjf=cpjf+3000000 where CStr(id)='" & id & "'"
  conn.execute sql
ltlyuan="你在第"&idss&"期购买的彩票中了特等奖,系统已自动给你加了3000000金币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbrs.Movenext
  if objgbrs.EOF then Exit for
 Next
sql="delete from sqcp "
  conn.Execute(sql)
  Application.Unlock

End if
End if
objgbrs.close
Set objgbrs= Nothing
%>