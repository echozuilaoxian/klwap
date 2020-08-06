<% LANGUAGE="VBSCRIPT" %>
<%
	db1="/bbs/sqcp/cai.mdb"
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.CommandTimeOut = 999
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
    conn.mode = 3
    conn.Open connstr
%>
