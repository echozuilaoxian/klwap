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
<card title="文件分类修改">
<p>
<%
    dim rs,sql,lid
    lid=request.querystring("lid")
    set rs=server.CreateObject ("ADODB.Recordset") 
sql="Select * from wjclass where id="&lid
rs.open sql,conn,2,3  
if not (rs.bof and rs.eof) then
rs.delete  
rs.close
set rs=nothing
sql="delete from wjlist Where id="&lid
  conn.Execute(sql)
sql="delete from wjfile Where lid="&lid
  conn.Execute(sql)
Response.Write "文件类别(包含类别中的文件)删除成功!"     
else
Response.Write "文件类别删除失败!类别不存在或者已删除!"  
%>
<%end if%>
<br/>----------<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>