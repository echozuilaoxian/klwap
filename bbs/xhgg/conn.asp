<% LANGUAGE="VBSCRIPT" %>
<%
	db1="/bbs/xhgg/#klwll.mdb"
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.CommandTimeOut = 1200
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
    conn.mode = 3
    conn.Open connstr
%>
