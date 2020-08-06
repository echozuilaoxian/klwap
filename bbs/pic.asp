<%
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select top 4 * from myalbum where bz='1' order by times desc"
  objgbrs1.open ssql,conn,3,3
if objgbrs1.eof then
   Response.write "<br/>暂时没有新上传相片<br/>"
  else
objgbrs1.PageSize=3
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs1.PageCount then pages=objgbrs.PageCount
objgbrs1.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrs1.PageSize
tjhm=objgbrs1("ids")
Response.write "<a href='/BBs/myalbum/myalbum.asp?id=" & objgbrs1("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs1("xclink") & "' width='30' height='40' alt='相'/></a>"
objgbrs1.Movenext
if objgbrs1.EOF then Exit for
 Next
End if
%><br/>