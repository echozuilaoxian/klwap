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
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<card id="index" title="栏目移动管理"><p>
请选择要移动到的栏目:<br/><br/>
<%id= int(request.QueryString("id"))
  ids= int(request.QueryString("ids"))
if ids="" then ids=0
   lxl= request.QueryString("lx")
        set rs=server.createobject("adodb.recordset")
sql = "select * from class Where parent="&ids&" and lx=0"
rs.open sql,conn,1,2
If Not rs.eof	Then
	PageSize=10						
	Dim Count,page,pagecount,gopage,parent			
	gopage="move.asp?sid="&sid&"&amp;id="&id&"&amp;ids="&ids&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
%>
<a href="move.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;ids=<%=rs("classid")%>&amp;lx=<%=lxl%>">[+]</a>|<a href="movecl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lxl%>&amp;iid=<%=rs("classid")%>"><%=ubb1(left(rs("class"),8))%></a><br/>
<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	(没有栏目)

<%end if
rs.close
set rs=nothing
conn.close
set conn=nothing%><br/>
<a href="movecl.asp?sid=<%=sid%>&amp;iid=0&amp;id=<%=id%>&amp;lx=<%=lxl%>">[移到首页]</a><br/>
----------<br/>
<a href="class.asp?sid=<%=sid%>">[栏目管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>