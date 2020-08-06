<%
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
if id="" then id=""&iduse&""
set ps=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyhome where jyid=" & id & ""
ps.open ssql,conn
if ps.eof then
response.write ""
end if
ps.close
Set ps= Nothing

%>
<%
Function frionline()
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select id from SoftDown_online where ids='" & id & "'"
 objgbrr.open ssql,conn
if not objgbrr.eof then
      frionline="(在线)"
   End if
set objgbrr=nothing
End function
       set obj=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where id=" & id & ""
       obj.open ssql,conn
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyhome where jyid=" & id & ""
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "<br/>用户还没有开通家园<br/><a href='/bbs/xhjy/sxft.asp?SessionID=" & SessionID & "'>开通家园</a>"
else
set rb2=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyxq where xqid=" & id & " and xqlx<>2 order by xqtime desc"
  rb2.open sql,conn,1,3
Response.write "<br/><img src='/bbs/xhjy/xq.gif' alt=''/><a href='/bbs/xhjy/homexq.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>主人心情(" & rb2.RecordCount & ")</a><br/>"
if rb2.eof then
Response.write "暂无心情<br/>"
else
if rb2("xqlx")=0 then
Response.write "" & rb2("xqnr") & "<br/>"
else
Response.write "此条心情不公开<br/>"
end if
end if
rb2.close
Set rb2= Nothing

Response.write "------------<br/><img src='/bbs/xhjy/fk.gif' alt=''/><a href='/bbs/xhjy/homefk.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>家园访客(共" & objgbrs("jyfk")&"次)</a><br/>最近访客<br/>"
dim rb1
set rb1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyfk where fkzid=" & id & " order by times desc"
  rb1.open sql,conn,1,3
if rb1.eof then
Response.write ""
else
For i=1 to 3
Response.write "<a href='/bbs/xhjy/home.asp?id=" & rb1("fkfid") & "&amp;SessionID=" & SessionID & "'>" & rb1("fkname") & "(" & rb1("fkfid")&")</a><br/>"
rb1.Movenext
if rb1.EOF then Exit for
 Next
end if
rb1.close
Set rb1= Nothing

dim rt1
set rt1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyly where lyzid=" & id & " order by lytime desc"
  rt1.open sql,conn,1,3
response.write "------------<br/><img src='/bbs/xhjy/ly.gif' alt=''/><a href='/bbs/xhjy/homely.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>留言(共" & objgbrs("jyly")&"条)</a><br/>" 
if rt1.eof then
Response.write ""
else
For i=1 to 3
if rt1("lylx")=0 then
Response.write "<a href='/bbs/xhjy/home.asp?id=" & rt1("lyfid") & "&amp;SessionID=" & SessionID & "'>" & rt1("lyfname") & "(" & rt1("lyfid")&")</a>:" & rt1("lynr") & "<br/>"
end if
if rt1("lylx")=3 then
Response.write "<a href='/bbs/xhjy/home.asp?id=" & rt1("lyfid") & "&amp;SessionID=" & SessionID & "'>" & rt1("lyfname") & "</a>:" & rt1("lynr") & "<br/>"
end if
rt1.Movenext
if rt1.EOF then Exit for
 Next
end if
rt1.close
Set rt1= Nothing
if obj("id")<>iduse then
Response.write "<input type='text' name='abcyi88' title='回复内容' maxlength='120' /><anchor>给他留言<go method='post' href='/bbs/xhjy/ly.asp?SessionID=" & SessionID & "'><postfield name='abcyi88' value='$(abcyi88)'/><postfield name='lyzid' value='"&id&"'/><postfield name='lyfid' value='"&iduse&"'/><postfield name='lyfname' value='"&fkname&"'/><postfield name='lx' value='0'/></go></anchor><br/>"
end if
Response.write "------------<br/>"

'访客记录
       set oba=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyfk where fkzid=" & id & " and fkfid=" & iduse & ""
       oba.open ssql,conn
if oba.eof then
if ""&id&""<>""&iduse&"" then
  sql="insert into jyfk(fkzid,fkfid,fkname)values("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(fkname) & ")"
  conn.execute sql
  sql="update jyhome set jyfk=jyfk+1 where jyid=" & id & ""
  Application.Lock
  conn.execute sql
  Application.Unlock
end if
else
if oba("fkzid")<>iduse then
set obaa=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyfk where fkzid=" & id & " and fkfid=" & iduse & " and DATEDIFF('s', times, now()) > 2*60"
obaa.open ssql,conn
if not obaa.eof then
  sql="update jyhome set jyfk=jyfk+1 where jyid=" & id & ""
  conn.execute sql
end if
obaa.close
Set obaa= Nothing
  sql="update jyfk set times=now(),fkname='" & fkname & "' where fkzid=" & id & " and fkfid=" & iduse & ""
  conn.execute sql
  Application.Unlock
end if
end if
oba.close
Set oba= Nothing
'结束

end if
%>