<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<% dim Rs,Sql,id,act
act=request.QueryString("act")
ID=cint(request.QueryString("ID"))
if act=1 then
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select [active] from [link] Where ID="&ID
Rs.open Sql,conn,1,3
if not (rs.eof and rs.bof) then
Rs("active")=0
Rs.update()
%>
<card id='card1' title='友链审核成功!' ontimer='Admin_link.asp?sid=<%=sid%>'><timer value='5'/>
<p>友链审核成功!正在返回...
<%else%>
<card id="card2" title="待审网站">
		<p>找不到该网站,可能被删除了!<br/>
<%end if%></p></card></wml><%call RSClose()%>
<%elseif act=2 then%>
<% dim rss,Sqll,i
set Rss=Server.CreateObject("ADODB.Recordset")
Sqll="select [active] from [link] Where active<>0"
Rss.open Sqll,conn,1,3
if rss.recordcount>0 then
for i=1 to rss.recordcount
Rss("active")=0
Rss.update()
rss.movenext
next
%>
<card id='card1' title='全部友链审核成功!' ontimer='Admin_link.asp?sid=<%=sid%>'><timer value='5'/>
<p>友链审核成功!正在返回...
</p></card></wml>
<%else%>
<card id='card1' title='待审网站!' ontimer='Admin_link.asp?sid=<%=sid%>'><timer value='5'/>
<p>待审网站在数据中已无!<br/>
</p></card></wml><%end if%><%call RSSClose()%><%end if%>