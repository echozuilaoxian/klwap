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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传文章</title></head>
<body>
<%
dim id
id= int(request.QueryString("id"))
	if id<>"" then
%><form id="form1" name="form1" method="post" action="upload.asp?sid=<%=sid%>&amp;id=<%=id%>"><p>文章上传系统<br/>
		标题:<input name="title" value=""/><br/>
内容:<textarea name="test" cols="18" rows="10"/></textarea><br/>
作者:<input name="user" title="名字" maxlength="20"/><br/>
<br/>是否上传图片<br/>
                <select title="上传" name="pic" value="">
                <option title="不上传" value="2">不上传</option>
                <option title="上传" value="1">上传</option>
                </select><br/><br/>
		<input name="ok" type="submit" value="上传"/></form>
<%
else%>
请不要非法传递参数！<br/>
<%end if%>
<br/>提示:如果要强制分页,请用||来分割.<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
</p>
</body>
</html>