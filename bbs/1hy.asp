<%dim w,m,objgbrsx
set objgbrsx=nothing
set objgbrsx=Server.CreateObject("ADODB.Recordset")
ssql="select * from myfriend where Cstr(ids)=" & iduse & " and Left(friid,1)<>'*' order by friid"
objgbrsx.open ssql,conn,1,3
if objgbrsx.eof then
   w=0
   m=0
Else
   m=0
   w=CLng(objgbrsx.RecordCount)
   For k=1 to objgbrsx.PageSize+500
      tjhm=objgbrsx("friid")
      if frionline="(在线)" then m=m+5
      objgbrsx.Movenext
      if objgbrsx.EOF then Exit for
   Next
End if

%>
   