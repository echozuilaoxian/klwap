<%
connstr="DBQ="+server.mappath("/bbs/shc/#mybuy1999.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
    dim rs,sql
    set rs=server.CreateObject ("ADODB.Recordset") 

rs.open "Select * from jiudian1 where id="&request("id") ,conn,2,3  

rs.delete  
  
        

     
     response.redirect "ltsc1.asp"
%>
