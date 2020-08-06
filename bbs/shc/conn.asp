<%
dim conn,connstr
connstr="DBQ="+server.mappath("#mybuy1999.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
%>