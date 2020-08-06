<%dim jdshow3,tj,objgbrst
jdshow=CLng(Session("showjd"))
tj="t"
  set objgbrst=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 2 tj,biaoti,itid,tjhm,id from wuza where tj='"& tj &"' order by id desc"

  objgbrst.open ssql,conn,1,1
 objgbrst.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrst.pagecount then
    page=objgbrst.pagecount
  End if
if objgbrst.eof then
Else
 objgbrst.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrst.PageSize
    bihaocont=bihaocont+1
    tjhm=objgbrst("tjhm")
    hfyl=left(objgbrst("biaoti"),11)
   if len(objgbrst("biaoti"))>11 then
    hfyl=hfyl+"..."
   End if 
Response.write "<img src='/bbs/tj.gif' alt=''/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrst("itid") & "&amp;id=" & objgbrst("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
    objgbrst.Movenext
  if objgbrst.EOF then Exit for
    Next
  End if
objgbrst.close
set objgbrst=nothing
%>
   