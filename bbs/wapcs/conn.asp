<%
set conn=Createobject("ADODB.Connection")
conn.ConnectionString="DBQ="& server.mappath("#yxxe")& ";DRIVER={Microsoft Access Driver (*.mdb)};"
conn.open
 sub endConnection()
 conn.close
 set conn=nothing
 end sub
%>