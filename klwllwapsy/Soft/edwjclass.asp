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
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="分类修改结果">
<p>
<%      lid=request.querystring("lid")
        name=request.form("name")
        if name="" then
response.write "分类名称不能为空!<br/>"
response.write "<a href='editwjclass.asp?lid="&lid&"&amp;sid="&sid&"'>返回修改</a><br/>"
else
        set rs=server.createobject("adodb.recordset")
	sql="select * from wjclass where id="&lid
	rs.open sql,conn,1,3
        rs("name")=name
        rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
response.write "修改成功!"
end if
%>
<br/>----------<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
