<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%

    dim rs,sql
    set rs=server.CreateObject ("ADODB.Recordset") 

rs.open "Select * from gogo where id="&request("id") ,conn,2,3  

rs.delete  
  
        

     
     response.redirect "admingg.asp?adminmid="&request("adminmid")&""
%>
