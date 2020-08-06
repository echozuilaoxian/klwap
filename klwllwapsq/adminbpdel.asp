<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card id='main' title='删除帮派'>
<p>
<%

    dim rs,sql
    set rs=server.CreateObject ("ADODB.Recordset") 

rs.open "Select * from jzbl where id="&request("id") ,conn,2,3  

rs.delete  
  
        
Response.Write "帮派删除成功！"     
%>
<br/>------------<br/>
<a href="adminbp.asp?adminmid=<%=request("adminmid")%>">返回帮派管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a>
</p>
</card>
</wml>