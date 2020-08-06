<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<!-- #include file="Upload.inc" -->
<title>结果</title>
</head>
<body>
<%
dim id,classid,test,title,user
id=request.querystring("id")
   classid=request("classid") 
if id="" or IsNumeric(id) = False then
  Response.write "ID错误！"
  Response.write "</body></html>"
  Response.end
end if
if classid="" or IsNumeric(classid) = False then
  Response.write "ID错误！"
  Response.write "</body></html>"
  Response.end
end if
 test=request.form("test")
 user=request.form("user")
 title=request.form("title")
        set rs=server.createobject("adodb.recordset")
	sql="select * from sms Where id="&id
	rs.open sql,conn,1,3
        rs("test")=test
        rs("user")=user
        rs("title")=title
        rs.update
	rs.close
	set rs=nothing
response.write "文章编辑成功!"
%><br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</body>
</html>