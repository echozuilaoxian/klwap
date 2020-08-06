<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title='今日广告点击'><p align='left'>
<%
'============================================================
' Copyright 2007-09 燃点真情. All Rights Reserved.
' Last Update: 2007-12-16  13:28
' E-Mail: xivn@163.com  QQ:531233814
'============================================================
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from [ltgg] where DATEDIFF('d',ttmm,now())=0 order by [id] desc"
rs.open sql,conn,1,1 
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=15						
	Dim Count,page,pagecount,gopage			
	gopage="todayad.asp?sid="&sid&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))					
	For i=1 To PageSize     						
	If rs.eof Then Exit For				
%><%=i+(page-1)*PageSize%>.会员<a href="face.asp?hk=<%=hk%>&amp;id=<%=Rs("ggdj")%>"><%=Rs("name")%></a>广告ID:<%=rs("gghf")%><br/>时间:<%=rs("ttmm")%><br/>
<%   
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">[GO]</a><br/>"
Else
%>
	暂时没有人点击广告！<br/>
<%
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
                <a href="delad.asp?sid=<%=sid%>">清空记录</a><br/>
		<a href="admin_go.asp?sid=<%=sid%>">[广告管理]</a><br/>
		<a href="index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p></card></wml>