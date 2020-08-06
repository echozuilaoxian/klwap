<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================

'============================================================ 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑文章</title></head>
<body>
<%
 id=request("id")
   classid=request("classid") 
        set rs = server.createobject("adodb.recordset")
	sql="select * from sms where id="&id
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	response.write "<p>文章不存在<br/>"
	else
%><form id="form1" name="form1" method="post" action="upeditsave.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;classid=<%=classid%>"><p>
		标题:<input name="title" value="<%=ubb(rs("title"))%>"/><br/>
作者:<input name="user" value="<%=ubb(rs("user"))%>"/><br/>
内容:<textarea name="test" cols="18" rows="10"/><%=ubb(rs("test"))%></textarea><br/>

		<input name="ok" type="submit" value="编辑文章"/></form>

<%end if%>
<br/>提示:如果要强制分页,请用||来分割.<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
</p>
</body>
</html>