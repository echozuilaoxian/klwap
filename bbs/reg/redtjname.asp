<% LANGUAGE="VBSCRIPT" %>
<%
Function redtjname()
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rs=conn.execute(sql)
		redtjname=rs("usename")
set rs=nothing
End Function
%>