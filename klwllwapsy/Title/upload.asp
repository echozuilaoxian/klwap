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
<p>
<%
dim id
id=request.querystring("id")
 test=request.form("test")
 title=request.form("title")
 user=request.form("user")
 pic=request.form("pic")
        set rs=server.createobject("adodb.recordset")
	sql="select * from sms"
	rs.open sql,conn,1,3
        rs.addnew
        rs("classid")=id
        rs("test")=test
        rs("user")=user
        rs("title")=title
        rs.update
	rs.close
	set rs=nothing
response.write "记录添加成功!"
upup(pic)
function upup(str)
if str=1 then
set rs2=server.CreateObject("adodb.recordset")
		sql2="select top 1 * from sms order by id desc"
		rs2.open sql2,conn,1,1            
                idd=rs2("id")
		Rs2.close
		Set Rs2=nothing
response.write("因为你选择了上传图片,请上传<br/>")
response.write("<form action='uploadd.asp?sid="&sid&"&amp;cid="&idd&"&amp;id="&id&"' enctype='multipart/form-data' method='post'>图片文件:<input name='file' type='file' title='选择图片' size='10'><br/><input type='submit' name='submit' value='提交图片' emptyok='true'/>")
end if
end function
%><br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</body>
</html>