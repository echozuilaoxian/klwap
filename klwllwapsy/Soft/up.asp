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
<%Set Rs1 = Server.CreateObject("Adodb.Recordset")
	Sql1 = "SELECT name,lid from wjlist order by Lid desc"
	rs1.open sql1,conn,1,1
%>
<form name="form1" METHOD="POST" ACTION="upsave.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>" ENCTYPE="multipart/form-data"><p>文件上传系统<br/>
选择类别:
<select name="lid">
<% do while not rs1.eof
%>
<option value='<%=rs1("lid")%>'><%=rs1("name")%></option>   
<%  rs1.movenext
        loop
%></select><br/>
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
<a href="wjclass.asp?sid=<%=sid%>">[文件大类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</body>
</html>
