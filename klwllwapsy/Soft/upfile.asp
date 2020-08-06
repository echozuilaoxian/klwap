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
<title>上传文件</title></head>
<body>
<%
dim lid
lid=TRim(Request("lid"))
idd=request.querystring("idd")
	if not isnumeric(lid) then lid=""
	if lid<>"" then
%><form name="form1" METHOD="POST" ACTION="upload.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>" ENCTYPE="multipart/form-data"><p>文件上传系统<br/>
		文件名称:<input name="name" type="text"/><br/>
                文件来源:<input name="laiy" type="text"/><br/>
                文件说明:<textarea name="title" cols="18" rows="10"/></textarea><br/>
		选择文件:<input type="file" name="filefield1"><br/> 
                建议所上传文件名和目录组合是字母与数字.<br/>  
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
<a href="wjlist.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[文件列表]</a><br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href="wjclass.asp?sid=<%=sid%>">[文件大类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</body>
</html>
