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
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="栏目分类管理">
<p><%=now%><br/>
<% id= int(request.QueryString("id"))
   idd= int(request.QueryString("idd"))
   lxl= request.QueryString("lx")
if lxl=0 then %>
<a href="tjfl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lxl=<%=lxl%>">[添加栏目]</a><br/>
<%end if%>
<% set rs1=server.createobject("adodb.recordset")
sql1 = "select * from class where classid="&id
rs1.open sql1,conn,1,1
if rs1("lx")=0 then lxx="页面菜单"
if rs1("lx")=1 then lxx="文章菜单"
if rs1("lx")=2 then lxx="文字段落"
if rs1("lx")=3 then lxx="直接显图"
if rs1("lx")=4 then lxx="超级链接"
if rs1("lx")=5 then lxx="WML标签"
if rs1("lx")=7 then lxx="文件栏目"
if rs1("lx")=8 then lxx="随机广告"
if rs1("lx")=10 then lxx="最新文章"
if rs1("lx")=11 then lxx="最热文章"
if rs1("lx")=12 then lxx="随机文章"
if rs1("lx")=13 then lxx="最新文件"
if rs1("lx")=14 then lxx="最热文件"
if rs1("lx")=15 then lxx="随机文件"
if rs1("lx")=16 then lxx="最新贴子"
if rs1("lx")=17 then lxx="最热贴子"
if rs1("lx")=18 then lxx="随机贴子"
response.write ("项目名称:"&ubb1(left(rs1("class"),30))&"<br/>")
response.write ("项目类型:"&lxx&"<br/>")
response.write ("项目编号:"&rs1("lx")&"<br/>")
response.write ("项目排序:"&rs1("pid")&"<br/>")
response.write ("-----------<br/>")
rs1.close
set rs1=nothing
%>
<% set rs=server.createobject("adodb.recordset")
sql = "select * from class where parent="&id&" order by pid asc"
rs.open sql,conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10							
	Dim Count,page,pagecount,gopage,parent			
	gopage="clist.asp?sid="&sid&"&amp;id="&id&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
%><a href="clist.asp?sid=<%=sid%>&amp;id=<%=rs("classid")%>&amp;idd=<%=id%>&amp;lx=<%=rs("lx")%>&amp;lxl=<%=lxl%>">[管理]></a><%=rs("pid")%>.<%=ubb1(left(rs("class"),20))%><br/>

<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	(没有下级栏目)

<%end if%>
<br/><img src="/img/hr.gif" alt=""/><br/>
<a href="editclass.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lxl%>">[编辑栏目]</a><br/>
<a href='move.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lxl%>'>[移动栏目]</a><br/>
<a href='delcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;idd=<%=idd%>&amp;lx=<%=lxl%>'>[删除栏目]</a><br/>
<%if idd<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=idd%>&amp;lx=<%=lxl%>">[栏目分类]</a><br/>
<%end if%>
<a href="class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
<%
rs.close
set rs=nothing
%>
</p>
</card>
</wml>
