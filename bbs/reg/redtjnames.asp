<% LANGUAGE="VBSCRIPT" %>
<%
Function redtjnames()
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rs=conn.execute(sql)
		redtjnames=rs("myhz")
set rs=nothing
End Function
%>