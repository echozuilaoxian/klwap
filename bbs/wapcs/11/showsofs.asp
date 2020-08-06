<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!--#include FILE="ltinc/md5.asp"-->
<!--#include file="ltinc/char.asp"-->
<% Response.ContentType="text/vnd.wap.wml;charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card id="main" title="网友上传文件列表">
<p>
<%
sq="select * from data order by id desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
rs.open sq,conn,1,2
If Not rs.bof Or Not rs.eof Then
%>
共有<%=rs.recordcount%>个文件<br/>
---------<br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Rs.PageSize =10
max=Rs.PageCount
page=request("page")
IF Not IsEmpty(Page) Then
IF Not IsNumeric(Page) Then
Page=1
Else
Page=Cint(Page)
End IF
IF Page > Rs.PageCount Then
Rs.AbsolutePage = Rs.PageCount
ElseIF Page <= 0 Then
Rs.AbsolutePage = 1
Else
Rs.AbsolutePage = Page
End IF
Else
page=1
Rs.AbsolutePage = page
End IF
%>
<%
For i=1 to Rs.PageSize
If Rs.Eof Then
Exit For
End If
%>
<%=i+(page-1)*Rs.PageSize%>.
<a href="softdowns.asp?id=<%=rs("id")%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>"><%=c2u(rs("title"))%></a><br/>
<%
  Rs.MoveNext
Next%>
-------------<br/>
<%if CStr(page)<>1 Then%>
<a href="showsofs.asp?Page=<%=(Page-1)%>&amp;SessionID=<%=SessionID%>">&#19978;&#19968;&#39029;</a>
<%end if%>
<%If CStr(page)<>CStr(max) then%>
<a href="showsofs.asp?Page=<%=(Page+1)%>&amp;SessionID=<%=SessionID%>">&#19979;&#19968;&#39029;</a>
<%End if%>
(<%=page%>/<%=max%>)<br/>
<input name="page" title="&#x9875;&#x6570;" type="text" value="1" format="*n" maxlength="3" size="2"/>
<a href="showsofs.asp?Page=$page&amp;SessionID=<%=SessionID%>">&#36339;&#36716;</a><br/>
<%else%>
没有文件！<br/>
<%End if%>
-------------<br/>
<a href="/bbs/myalbum/index.asp?SessionID=<%=SessionID%>">[网友相册]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a>
</p>
</card>
</wml>
