<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<card id="card1" title="申请友链成功"><p>
<% dim rss,sqll,rs,sql
set Rss=Server.CreateObject("ADODB.Recordset")
Sqll="select [Title],[URLL],[Active] from [link_admin] order by id desc"
Rss.open Sqll,conn,1,1
titie=Rss("title")
urll=Rss("urll")
Active=Rss("Active")
call rssClose()
set Rs=Server.CreateObject("ADODB.Recordset")
conn.CommandTimeOut = 999
Sql="select top 1 * from [link] order by id desc"
RS.open Sql,conn,1,1%>
添加友链地址成功，<% if Active=1 then%>请等待站长审核，审核通过后才会显示<br/>
<%else%>你的友链已经显示出来!<br/>
<%End if%>
贵站返回我站的链接地址是:<%=URLL%>/link/Go.asp?id=<%=Rs("ID")%><br/>
网站名称:<%=titie%><br/>
<%call lasts()%><%call ALLClose()%>



 