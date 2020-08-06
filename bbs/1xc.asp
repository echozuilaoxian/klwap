<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select top 3 * from myalbum where bz='1' order by times desc"
  objgbrs.open ssql,conn,3,3
if objgbrs.eof then
   Response.write "暂时没有新上传相片<br/>"
  else

For k=1 to objgbrs.PageSize
Response.write "<a href='/bbs/Myalbum/Myalbum.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'><img src='" & objgbrs("xclink") & "' width='45' height='50' alt='相'/></a>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if%>
   