<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conn.asp"-->
<!--#include file="ltinc/char.asp"-->
<!--#include FILE="ltinc/md5.asp"-->

<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="我的文件">
<p>
<%
SessionID=request.querystring("SessionID")
Page=request.querystring("Page")
iduse=Session("useid")
id=request("id")
sq="select * from data where id = "&id
Set Rs = Server.CreateObject("Adodb.Recordset")
rs.open sq,conn,1,2
aaa=rs("dataname")
sss=rs("explain")
ddd=rs("title")
fff=rs("IswNumsIP")
%>
<img src="soft_down.asp?id=<%=rs("id")%>" alt="load.."/><br/>
<anchor>保存我的文件夹<go method='post' href='/bbs/myalbum/addbook.asp?SessionID=<%=SessionID%>'><postfield name='xcname' value='<%=ddd%>'/><postfield name='xclink' value='/bbs/wapcs/soft_down.asp?id=<%=rs("id")%>'/></go></anchor><br/>
文件格式:<%
filetype=rs("dataname")
i=InStrRev(filetype,".")
l=Len(filetype)
If i>0 Then
  filetype=Right(filetype,l-i)
End If%>
<%=filetype%><br/>
文件大小:<%size=Round(rs("filesize")/1024,2)
If Left(size,1)="." Then size="0"&size
%><%=size%>KB<br/>
文件名称:<%=ddd%><br/>
文件介绍:<%=sss%><br/>
文件地址:<%=aaa%><br/>
-----------<br/>
<a href="showsofs.asp?Page=<%=Page%>&amp;SessionID=<%=request("SessionID")%>">[返回上级]</a><br/>
<a href="/bbs/myalbum/index.asp?SessionID=<%=SessionID%>">[网友相册]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>