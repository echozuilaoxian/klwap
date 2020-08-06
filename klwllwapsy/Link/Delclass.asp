<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<% dim Rs,Sql,id,Rss,Sqll
ID=request.QueryString("ID")
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select * from [linkclass] Where CLASSID="&ID
Rs.open Sql,conn,2,3
rs.delete  
call RsClose()
sql="delete from link Where CLASSID="&ID
  conn.Execute(sql)
%>
<card id='card1' title='友链类别删除成功!' ontimer='Link_class.asp?sid=<%=sid%>'><timer value='5'/><p>
友链类别(包含友链)删除成功!<br/>    
<a href="Link_class.asp?sid=<%=sid%>">返回分类管理</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>返回友链后台</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>