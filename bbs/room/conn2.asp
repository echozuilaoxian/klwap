
<% 
dim conn   
dim connstr
connstr="DBQ="+server.mappath("/bbs/room/#roomsrom.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
%>