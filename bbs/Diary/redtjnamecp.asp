<% LANGUAGE="VBSCRIPT" %>
<%
Function redtjname()
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rscc=conn.execute(sql)
		redtjname=rscc("usename")
set rscc=nothing
End Function

Function redtjnames()
	sqld="select * from usereg where CStr(id)='" & tjhms & "'"
	set rscsr=conn.execute(sqld)
		redtjnames=rscsr("usename")
set rscsr=nothing
End Function
%>