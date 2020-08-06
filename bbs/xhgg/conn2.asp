<% LANGUAGE="VBSCRIPT" %>
<%
	db2="/admin/Database/#qqccb.mdb"
	Set conn2 = Server.CreateObject("ADODB.Connection")
	conn2.CommandTimeOut = 1200
	conn2str="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db2)
    conn2.mode = 3
    conn2.Open conn2str
%>
