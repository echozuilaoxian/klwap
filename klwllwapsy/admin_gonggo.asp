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
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!-- #include file="conn.asp" -->
<!-- #include file="admin.asp" -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%

		IF  Request.QueryString("Action")="view" Then
			call view
		elseiF  Request.QueryString("Action")="del" Then
			call del
		elseiF  Request.QueryString("Action")="edit" Then
			call edit
		elseiF  Request.QueryString("Action")="add" Then
			call add
		elseiF  Request.QueryString("Action")="save" Then
			call save
		else

			call index
		end if


Function index%>


		<card id="index" title="公告管理">
		<p align="left"><img src="/IMG/9.gif" alt='公告管理'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>


		<%

Set Rs = Server.CreateObject("Adodb.Recordset")
Sql = "SELECT * FROM gonggo order by id desc"
Rs.Open Sql,conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10							
	Dim Count,page,pagecount,gopage,parent			
	gopage="admin_gonggo.asp?sid="&sid&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
%><%=i+(page-1)*PageSize%>.<a href='admin_gonggo.asp?sid=<%=sid%>&amp;Action=view&amp;id=<%=ubb(rs("id"))%>'><%=ubb(rs("name"))%></a><br/>

<%     
	rs.moveNext
  								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
%>
	(没有公告)

<%end if%>
		<%
		Rs.close
		set rs=nothing

		Response.Write("<br/><a href='admin_gonggo.asp?sid="&sid&"&amp;Action=add'>[发布公告]</a><br/>")

end Function

Function add%>

		<card id="add" title="发布公告">
		<p>
		标题:<br/><input name="name" maxlength="255" /><br/>
		内容:(支持UBB)<br/><input name="title" /><br/> 
		<anchor>发布
		<go href="admin_gonggo.asp?sid=<%=sid%>&amp;Action=save&amp;edit=add" method="post">
		<postfield name="name" value="$(name:n)" />
		<postfield name="title" value="$(title:n)" />
		</go>
		</anchor><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>

	<%
end Function

Function edit
	id=TRim(Request("id"))
	if not isnumeric(id) then id=""



		if id=""  then%>
			<card id="index" title="出错啦"><p>出错啦!请不要非法提交参数.<br/>
		<%else

			Set Rs = Server.CreateObject("Adodb.Recordset")
			Sql = "SELECT * FROM gonggo where id="&id
			Rs.Open Sql,conn,1,1


			if not (rs.bof and rs.eof)  then %>

				<card id="add" title="发布公告">
				<p>
				标题:<br/><input name="name" value="<%=rs("name")%>" maxlength="255" /><br/>
				内容:(支持UBB)<br/><input name="title" value="<%=rs("title")%>" /><br/> 
				<anchor>修改
				<go href="admin_gonggo.asp?sid=<%=sid%>&amp;Action=save&amp;edit=edit" method="post">
				<postfield name="name" value="$(name:n)" />
				<postfield name="id" value="<%=id%>" />
				<postfield name="title" value="$(title:n)" />
				</go>
				</anchor><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>
			<%else%>
				<card id="index" title="出错啦"><p>没有该公告!<br/>
			<%end if
			Rs.close
			set rs=nothing
		end if
end Function

Function view
	id=TRim(Request("id"))
	if not isnumeric(id) then id=""


		if id=""  then%>

			<card id="index" title="出错啦"><p>出错啦!请不要非法提交参数.<br/>
		<%else%>


		<card id="index" title="公告管理">
		<p>


		<%


			Set Rs = Server.CreateObject("Adodb.Recordset")
			Sql = "SELECT * FROM gonggo where id="&id
			Rs.Open Sql,conn,1,1


			if not (rs.bof and rs.eof)  then %>
				标题:<%=ubb(rs("name"))%><br/>
				内容:<%=ubb(rs("title"))%><br/>
				时间:<%=ubb(rs("time"))%><br/>
				<a href='admin_gonggo.asp?sid=<%=sid%>&amp;Action=edit&amp;id=<%=id%>'>[编辑]</a> <a href='admin_gonggo.asp?sid=<%=sid%>&amp;Action=del&amp;id=<%=id%>'>[删除]</a><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>
			<%else%>
				暂无公告!<br/>
			<%end if
			Rs.close
			set rs=nothing
		end if

end Function

Function  del
	id=TRim(Request("id"))
	if not isnumeric(id) then id=""

 		if id=""  then%>

			<card id="index" title="出错啦"><p>出错啦!请不要非法提交参数.<br/>
		<%else

			if Request("del")="true" then
				set rs=server.CreateObject("adodb.recordset")
				Sql = "SELECT * FROM gonggo where id="&id
				rs.open sql,conn,1,3
				if not (rs.bof and rs.eof)  then
					rs.delete
				end if
				Rs.close
				set rs=nothing%>

				<card id='index' title='删除公告'><p>
				已成功删除该公告!<br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>
			<%else%>

				<card id='index' title='删除公告'><p>
				是否要删除该公告?<br/>
				<a href='admin_gonggo.asp?sid=<%=sid%>&amp;Action=del&amp;del=true&amp;id=<%=id%>'>[确定删除]</a><br/><anchor>返回上页<prev/></anchor><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>
			<%end if
		end if
end Function


Function save
	name=Trim(Request("name"))
	title=Trim(Request("title"))
	id=TRim(Request("id"))
	if not isnumeric(id) then id=""


		if name=""  then errmsg=errmsg&"公告标题不能为空<br/>":flag=0
		if title=""  then errmsg=errmsg&"公告内容不能为空<br/>":flag=0

		if Request("edit")="edit" then
			if id=""  then errmsg=errmsg&"非法传递参数<br/>":flag=0

			if flag<>"0" then

				set rs=server.CreateObject("adodb.recordset")
				sql="select * from gonggo where id="&id
				rs.open sql,conn,1,3
					rs("name")=name
					rs("title")=title
				rs.update()
				Rs.close
				set rs=nothing%>


				<card id="index" title="修改公告" ontimer="admin_gonggo.asp?sid=<%=sid%>"><timer value='10'/>
				<p>
				修改公告成功<br/><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>

			<%else
				Response.Write("<card id='index' title='发布公告出错' ><p align='"&rs1("const")&"'>") 
				Response.Write(""&errmsg&"<br/><anchor>[返回修改]<prev/></anchor><br/>") 		
			end if
		else

			if flag<>"0" then

				set rs=server.CreateObject("adodb.recordset")
				sql="select * from gonggo"
				rs.open sql,conn,1,3
				rs.addnew()
					rs("name")=name
					rs("title")=title
					rs("time")=now()
				rs.update()
				Rs.close
				set rs=nothing%>


				<card id="index" title="发布公告" ontimer="admin_gonggo.asp?sid=<%=sid%>"><timer value='10'/>
				<p>
				发布公告成功<br/><br/>
<a href="admin_gonggo.asp?sid=<%=sid%>">[公告管理]</a><br/>

			<%else
				Response.Write("<card id='index' title='发布公告出错' ><p align='"&rs1("const")&"'>") 
				Response.Write(""&errmsg&"<br/><anchor>[返回修改]<prev/></anchor><br/>") 		
			end if

		END IF

end Function%>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card>
</wml>