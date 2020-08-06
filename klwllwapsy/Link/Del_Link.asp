<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<% dim rs,sql,id
id=request.Querystring("id")
classs=request.Querystring("class")
Set Rs=server.createobject("adodb.recordset")
Sql = "select * from [link] Where id="&id
Rs.open Sql,conn,2,3
if not (rs.bof and rs.eof) then
          rs.delete()  
               rs.update() 
                 dellink 

end if
%><%call ALLClose()%>
<%sub dellink()%><card id='card1' title='删除友链成功' ontimer='Admin_class.asp?sid=<%=sid%>&amp;id=<%=classs%>'><timer value='5'/>
<p>删除友链成功!正在返回...</p>
</card></wml><%Response.End%><%End Sub%>
<%call ALLClose()%>