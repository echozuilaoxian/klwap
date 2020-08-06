<% LANGUAGE="VBSCRIPT" %>
<%
Function redtjname()
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rscc=conn.execute(sql)
		redtjname=rscc("usename")
set rscc=nothing
End Function
%>