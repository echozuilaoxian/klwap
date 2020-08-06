<%
 set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from sjzk  order by id desc "
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
if objgbrsd("lasttlls")=540 then
Response.write "<br/>" & newyear & ttime & "前<a href='/BBS/xhcqsj/index1.Asp?hotid=" & objgbrsd("ids") & "&amp;SessionID=" & SessionID & "'>" &converttowidebaiti( objgbrsd("zname") )& "</a>" & objgbrsd("dong") & "<a href='/BBS/xhcqsj/index1.Asp?hotid=" & objgbrsd("idss") & "&amp;SessionID=" & SessionID & "'>" &converttowidebaiti( objgbrsd("bname") )& "</a>" & objgbrsd("bu") & "."
else
if objgbrsd("lasttlls")=541 then
Response.write "<br/>" & newyear & ttime & "前" &converttowidebaiti( objgbrsd("zname") )& "<a href='/BBS/tong/index1.Asp?SessionID=" & SessionID & "'>在同城同居</a>" & objgbrsd("bu") & "" &converttowidebaiti( objgbrsd("bname") )& "在" & objgbrsd("dong") & "."
else
if objgbrsd("lasttlls")=542 then
Response.write "<br/>" & newyear & ttime & "前[" &converttowidebaiti( objgbrsd("bname") )& "]在<a href='/BBS/lbxh/index.Asp?SessionID=" & SessionID & "'>龙宝交易厅</a>" & objgbrsd("dong") & "龙宝."
else
if objgbrsd("lasttlls")=200 then
Response.write "<br/>" & newyear & ttime & "前[" &converttowidebaiti( objgbrsd("bname") )& "]在<a href='/BBS/gp/index.Asp?SessionID=" & SessionID & "'>股票大厅</a>" & objgbrsd("dong") & objgbrsd("bu")&"."
else
Response.write "<br/>" & newyear & ttime & "前[" &UBBCodes( objgbrsd("dong") )& "]."
end if
end if
end if
end if
	objgbrsd.movenext
	loop
	end if

objgbrsd.close
set objgbrsd=nothing
%>