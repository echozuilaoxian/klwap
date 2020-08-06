<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>

<!-- #include file="conn2.asp" -->
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card id='main' title='操作提示'>
<p>是否删除:<br/>
<a href="#card2">确认</a>|<a href='adminltgform.asp'>放弃</a>
</p></card>
<card id="card2" title="操作提示"><p>
<%

    dim rs,sql
    set rs=server.CreateObject ("ADODB.Recordset") 

rs.open "Select * from rom where id="&request("id") ,conn,2,3  

rs.delete  
  
        
Response.Write "聊天室删除成功！"     
%>
<br/>----------
<br/><a href='addltgform.asp'>添加聊天室</a>
<br/><a href='adminltgform.asp'>聊天室管理</a>
<br/>
<anchor>返回上级<prev/></anchor>
<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>