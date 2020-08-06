<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<%
sq1="select * from upset order by id"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rs1.close
Set rs1=nothing
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="上传图片">
<p>
<%If request("id")="" Then response.redirect"/bbs/index.asp?SessionID="&SessionID&""%>
<%if request("id")=1 then %>
相片名不能为空！<br/>
<%End if%>
<%if request("id")=2 then %>
相片类型错误，上传不成功！<br/>
允许上传的相片类型有:<%=rsallowedfile%><br/>
<%End if%>
<%if request("id")=3 then %>
相片过大，上传不成功！<br/>
允许上传大小:<%=rsfilesize%>KB<br/>
<%End if%>
<%if request("id")=4 then %>
<%
size=CStr(request("size"))
sq2="select * from data where filesize='"&size&"'"
Set Rs2 = Server.CreateObject("Adodb.Recordset")
rs2.open sq2,conn,1,2
id=rs2("id")
title=rs2("title")
explain=rs2("explain")
size=rs2("filesize")
addtime=rs2("addtime")

%>
该图片已经上传！<br/>
上传时间:<%=addtime%><br/>
----------<br/>
<img src="soft_down.asp?id=<%=rs2("id")%>" alt="load.."/><br/>
名称:<%=title%><br/>
描述:<%=explain%><br/>
大小:<%size=Round(size/1024,2)
If Left(size,1)="." Then size="0"&size
%>
<%=size%>KB<br/>
<anchor>保存到图片夹<go method='post' href='/bbs/myalbum/addbook.asp?SessionID=<%=SessionID%>'><postfield name='xcname' value='<%=rs2("title")%>'/><postfield name='xclink' value='/bbs/wapcs/upload/<%=rs2("dataname")%>'/></go></anchor><br/>
<%
rs2.close
Set rs2=nothing
End if%>
<%if request("id")=5 then %>
请选择要上传的文件！<br/>
<%End if%>
<%if request("id")=6 then %>
系统错误，保存上传数据所需文件夹不存在！<br/>
请联系管理员！<br/>
<%End if%>
----------<br/>
<a href="/bbs/myalbum/index.asp?SessionID=<%=SessionID%>">[网友相册]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>