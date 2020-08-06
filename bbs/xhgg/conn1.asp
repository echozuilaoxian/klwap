<%
	db1="/bbs/xhgg/#klwll.mdb"
	Set liao = Server.CreateObject("ADODB.Connection")
	liao.CommandTimeOut = 1200
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
    liao.mode = 3
    liao.Open connstr
%>