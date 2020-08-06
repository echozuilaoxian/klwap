<%
dim conn,connstr
connstr="DBQ="+server.mappath("/bbs/wapcs/#yxxe")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
%>