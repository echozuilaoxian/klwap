<%
db="/bbs/hk/#xh6666.cn.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.open connstr
    dim rs,sql
    set rs=server.CreateObject ("ADODB.Recordset") 

rs.open "Select * from wap_album_content where id="&request("id") ,conn,2,3  

rs.delete  
  
        

     
     response.redirect "adminbo.asp"
%>
