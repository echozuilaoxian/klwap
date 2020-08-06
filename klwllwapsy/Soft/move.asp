<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<card id='index' title='文件分类'><p>
请选择要移动的分类:<br/>
<%id=int(request.QueryString("id"))
idd=request.querystring("idd")
lid=request.querystring("lid")
	Set Rs = Server.CreateObject("Adodb.Recordset")
	Sql = "SELECT * from wjlist order by id desc"
	Rs.Open Sql,conn,1,1
	If Not rs.eof	Then
	PageSize=10						
	Dim Count,page,pagecount,gopage,parent			
	gopage="move.asp?sid="&sid&"&amp;id="&id&"&amp;lid="&lid&"&amp;idd="&idd&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
%><a href="wjmove.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lid=<%=rs("lid")%>&amp;idd=<%=idd%>"><%=ubb(rs("name"))%></a><br/>
<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	(没有分类)

<%end if%><br/>
<a href="wjlist.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[文件列表]</a><br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件大类]</a><br/>
<a href='wjcl.asp?sid=<%=sid%>'>[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>