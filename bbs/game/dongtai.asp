<%
 set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from sjzk where bu='game' order by id desc "
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
Else
   do while not objgbrsd.eof
tjhm=objgbrsd("idss")
newyear=DateDiff("s",objgbrsd("timed"),now)
newyearr=newyear
ttime="秒钟"
if newyearr>59 then
newyear=Clng(int(newyearr/60))
ttime="分钟"
end if
if newyearr>3599 then
newyear=Clng(int(newyearr/3600))
ttime="小时"
end if
if newyearr>86399 then
newyear=Clng(int(newyearr/86400))
ttime="天"
end if
if objgbrsd("lasttlls")=542 then
Response.write "" & newyear & ttime & "前[" &converttowidebaiti( objgbrsd("bname") )& "]在<a href='/BBS/lbxh/index.Asp?SessionID=" & SessionID & "'>龙宝交易厅</a>" & objgbrsd("dong") & "龙宝<br/>"
else
if objgbrsd("lasttlls")=200 then
Response.write "" & newyear & ttime & "前[" &converttowidebaiti( objgbrsd("bname") )& "]在<a href='/BBS/gp/index.Asp?SessionID=" & SessionID & "'>股票交易所</a>" & objgbrsd("dong") & objgbrsd("bu")&"<br/>"
else
Response.write "" & newyear & ttime & "前[" &UBBCodes( objgbrsd("dong") )& "]<br/>"
end if
end if
	objgbrsd.movenext
	loop
	end if

objgbrsd.close
set objgbrsd=nothing
%>