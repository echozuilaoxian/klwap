<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from data where id="& request("id") &""
rs.open sql,conn,1,3
if rs.eof then
     response.write "ID错误！"
     response.end
   else
aa=rs("datadir")
rs.delete
rs.update
rs.close

FilePath=Server.MapPath("../"&aa) 
Dim fso 
Set fso = CreateObject("Scripting.FileSystemObject") 
IF fso.FileExists(FilePath) Then 
fso.DeleteFile(FilePath) 
End IF 
Set fso = Nothing 
   dim sql 
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="delete from Review where IswNumsClass="&request("id")  
   conn.execute sql
%>

<card id='card1' title='删除相片' ontimer='wap_showsoft.asp?adminmid=<%=request("adminmid")%>&amp;sort=<%=sort%>&amp;page=<%=page%>'><timer value='5'/>
<p>
删除成功，正在返回...<br/><br/>----------<br />
<%End IF%>
<a href="wap_showsoft.asp?adminmid=<%=request("adminmid")%>&amp;sort=<%=sort%>&amp;page=<%=page%>">返回管理相片</a><br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>