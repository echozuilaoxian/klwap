
<%
wap=request.querystring("wap")
Server.ScriptTimeout=999
dim page
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 1 * from wuzaes  order by times desc"
  objgbrs.open ssql,conn,1,1
 if objgbrs.eof then
      response.write "暂时没有日记<br/>"
   else
  objgbrs.PageSize=1
  page=CLng(Request("page"))
  if page<1 then page=1
  if page>objgbrs.pagecount then page=objgbrs.pagecount
objgbrs.absolutepage=page
if page=1 then
bihao=0
else
bihao=page*5-5
End if
response.write "<br/>[日记]"
For i=1 to objgbrs.PageSize
bihaocont=bihaocont+1
timee=objgbrs("id")
Response.write bihao+bihaocont & "." & "<a href='zcwwcl.asp?page=" & page & "&amp;timee=" & objgbrs("id") & "&amp;wap=" & wap & "'>" &  converttowide(objgbrs("biaoti")) & "</a>/人气:" & objgbrs("rc")&"<br/>(" & converttowidebaiti(objgbrs("xyjx")) & "ID:" & objgbrs("ujsjh") & ")<br/>"
%>



