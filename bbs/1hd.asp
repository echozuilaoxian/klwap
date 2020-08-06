<%dim hd,objgbrsd
hd="t"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 2 hd,biaoti,itid,id from wuza where hd='"& hd &"' order by id desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   'Response.write "&#x6682;&#x65E0;&#x8BB0;&#x5F55;"
Else
   do while not objgbrsd.eof
    hfyl=left(objgbrsd("biaoti"),13)
   if len(objgbrsd("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if 
Response.write "<img src='/bbs/gg.gif' alt=''/>"&converttowidebaiti("")&"<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrsd("itid") & "&amp;id=" & objgbrsd("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(hfyl)&"</a><br/>"
	objgbrsd.movenext
	loop
	end if
	objgbrsd.close
	set objgbrsd=nothing
%>
   