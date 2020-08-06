<% LANGUAGE="VBSCRIPT" %>
<%
	db1="/bbs/game/yyl/#cai.mdb"
	Set jjconn = Server.CreateObject("ADODB.Connection")
	jjconn.CommandTimeOut = 999
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
    jjconn.mode = 3
    jjconn.Open connstr
%>

