<%
jdshow=CLng(Session("showjd"))
a="t"
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 2 a,biaoti,itid,tjhm,id,nai from wuza where a='"& a &"' order by id desc"

  objgbrs1.open ssql,conn,1,1
 objgbrs1.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs1.pagecount then
    page=objgbrs1.pagecount
  End if
if objgbrs1.eof then

Else
 objgbrs1.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs1.PageSize
    bihaocont=bihaocont+1
    tjhm=objgbrs1("tjhm")
    hfyl=left(objgbrs1("biaoti"),30)
   if len(objgbrs1("biaoti"))>30 then
    hfyl=hfyl+""
   End if 
Response.write "<img src='/bbs/qian.gif' alt=''/><a href='/bbs/forum_content/BBs_receipt_ByContent.asp?ForumID=" & objgbrs1("itid") & "&amp;id=" & objgbrs1("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
    objgbrs1.Movenext
  if objgbrs1.EOF then Exit for
    Next
  End if
objgbrs1.close
set objgbrs1=nothing
%>
   