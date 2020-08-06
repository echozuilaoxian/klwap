<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<%
On Error Resume Next 
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")
rs1.close
Set rs1=Nothing
path=Server.Mappath("\")&"\"&rsformPath

Set fso = CreateObject("Scripting.FileSystemObject")
Set fldr = fso.GetFolder(path)
If err<>0 Then 
onerr=1
Else
onerr=2
End If
set fldr=nothing
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="创建文件夹" >
<p>
<%If onerr=1 then%>
文件夹未能创建成功，请自行创建！无此文件夹将不能成功上传文件！<br/>
<%Else%>
文件夹创建成功!<br/>
<%End if%>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回</a>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>