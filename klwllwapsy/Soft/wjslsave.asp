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
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="添加子分类">
<p>
<%      class1=request.form("class1")
        pid=request.form("pid")
if pid=""  or IsNumeric(pid)=False then 
pid=1
end if
        idd=request.querystring("idd")
	set rs=server.createobject("adodb.recordset")
	sql="select * from wjlist" 
	rs.open sql,conn,1,3
	rs.addnew
	rs("name")=class1
	rs("pid")=pid
	rs("id")=idd
	rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
文件小类栏目添加成功!
<br/>----------<br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href="wjclass.asp?sid=<%=sid%>">[文件大类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
