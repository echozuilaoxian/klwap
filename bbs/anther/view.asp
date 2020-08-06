<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="查看投票"><p>
<% wap=request.querystring("wap") %>
<%
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM biaoti"
rec.Open SQL,conn,1,1
   countall=countalls
if countall=0 then
   Response.write "还没有人投票呢~<br/><a href='/bbs/anther/topao.asp?wap=" & wap & "'>回投票系统</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>回社区首页</a></p></card></wml>"
   Response.end
End if
   response.write "共有" & countall & "人投了票<br/>--------<br/>"
   response.write "调查标题:" & rec("biaoti") & "<br/>--------<br/>"
   rec.Movenext
  Do While Not Rec.EOF
   topao=topao+1
   response.write "◆<b><u>" & rec("biaoti") &"</u></b><br/>共" & count & "票,占<b><u>" & left(count/countall*100,5) & "%</u></b><br/>"
   rec.MoveNext
  Loop
conn.close
set rec=nothing
set conn=nothing

Function countalls()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from useid"
  objgbrr.open ssql,conn,1,1
countalls=objgbrr.RecordCount
set objgbrr=nothing
End Function

Function count()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from useid where topao='" & Cstr(topao) & "'"
  objgbrr.open ssql,conn,1,1
count=objgbrr.RecordCount
set objgbrr=nothing
End Function
%>
----------
<br/><a href='/bbs/anther/topao.asp?wap=<%=wap%>'>[投票系统]</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>[社区首页]</a><br/><a href='/bbs/ztlb.asp?wap=<%=wap%>'>[论坛导航]</a><br/><a href='/index.asp?wap=<%=wap%>'>[狂野首页]</a>

</p>
</card>
</wml>

