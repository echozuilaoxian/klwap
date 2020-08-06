<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="添加文件">
<p>
<%
Dim name,laiy,title,fileurl,ggss,lid,size
name=trim(request.form("name"))
laiy=trim(request.form("laiy"))
title=trim(request.form("title"))
fileurl=trim(request.form("fileurl"))
ggss=trim(request.form("ggss"))
lid=trim(request.form("lid"))
size=trim(request.form("size"))
if name="" or laiy="" or title="" or fileurl="" or lid="" then
 Response.Write "各项都不能为空！<br/>"
 Response.Write	"<anchor>返回上级<prev/></anchor> "
 Response.Write "</p></card></wml>"
 response.end
 End if 
	Set Rs1 = Server.CreateObject("Adodb.Recordset")
	Sql1 = "SELECT id from wjlist where lid="&lid
	rs1.open sql1,conn,1,1
          if  not rs1.eof then
           idd=rs1("id")
           end if
         	Rs1.close
		Set Rs1=nothing
		set rs1=server.CreateObject("adodb.recordset")
		sql1="select * from wjfile"
		rs1.open sql1,conn,1,3
		Rs1.addnew
		Rs1("url")=fileurl
		Rs1("name")=name
		Rs1("size")=size
		Rs1("format")=ggss
		Rs1("title")=title
		Rs1("time")=now()
		Rs1("lid")=lid	
		Rs1("idd")=idd
		Rs1("laiy")=laiy
		Rs1.Update
		Rs1.close
		Set Rs1=nothing%>
添加记录成功!<br/>
<a href="Get.asp?sid=<%=sid%>">[继续采集]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>