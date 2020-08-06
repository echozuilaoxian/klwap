<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<!--#include FILE="char.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
password=rs1("password")
rs1.close
Set rs1=Nothing
adminmid=md5(password&"gotf.cn")
If adminmid=request("adminmid") Then mess="1"
%>
<% Response.ContentType="text/vnd.wap.wml;charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card id="main" title="文件列表">
<p>
<%
sq="select * from data order by id desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
rs.open sq,conn,1,2
If Not rs.bof Or Not rs.eof Then
%>
共<%=rs.recordcount%>个文件<br/>
---------<br/>
<%
Rs.PageSize =20
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
<a href="../softdown.asp?id=<%=rs("id")%>&amp;frompage=<%=page%>&amp;adminmid=<%=request("adminmid")%>"><%=c2u(rs("title"))%></a>|<a href="del.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>">&#x5220;&#x9664;</a><br/>
<%
  Rs.MoveNext
Next%>
-------------<br/>
<%if CStr(page)<>1 Then%>
<a href="showsoft.asp?Page=<%=(Page-1)%>&amp;adminmid=<%=request("adminmid")%>">&#19978;&#19968;&#39029;</a>
<%end if%>
<%If CStr(page)<>CStr(max) then%>
<a href="showsoft.asp?Page=<%=(Page+1)%>&amp;adminmid=<%=request("adminmid")%>">&#19979;&#19968;&#39029;</a>
<%End if%>
(<%=page%>/<%=max%>)<br/>
<input name="page" title="&#x9875;&#x6570;" type="text" value="1" format="*n" maxlength="3" size="2"/>
<a href="showsoft.asp?Page=$page&amp;adminmid=<%=request("adminmid")%>">&#36339;&#36716;</a><br/>
<%else%>
没有文件！<br/>
<%End if%>
-------------<br/>
<a href="admin.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="/bbs/index.asp">返回社区首页</a><br/>
</p>
</card>
</wml>
