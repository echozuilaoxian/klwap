<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<!--#include FILE="char.asp"-->
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="删除文件">
<p>
<%
sq1="select * from data where id="& request("id") &""
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
path=rs1("datadir")
''---------------
path=Server.Mappath("\")&"\"&path
Set FsoObj=Server.CreateObject("Scripting.FileSystemObject")
Set tempfileOBJ = FsoObj.GetFile(path)
tempfileOBJ.Delete
if Err <> 0 then
iserr=true
Err.Clear
End if
''---------------
rs1.delete
rs1.close
Set rs1=Nothing%>
<%If iserr=True then%>
删除文件错误！<br/>
<%else%>
删除文件成功！<br/>
<%End If%>
-------------<br/>
<a href="showsoft.asp?adminmid=<%=request("adminmid")%>">返回上级</a><br/>
<a href="index.asp">退出管理</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>