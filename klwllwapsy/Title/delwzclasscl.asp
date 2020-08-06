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
<card title="文章分类修改">
<p>
<%
    dim rs,sql,id
    id=request.querystring("id")
    set rs=server.CreateObject ("ADODB.Recordset") 
sql="Select * from wzclass where classid="&id
rs.open sql,conn,2,3  
if not (rs.bof and rs.eof) then
rs.delete  
rs.close
set rs=nothing
sql="delete from sms Where CLASSID="&ID
  conn.Execute(sql)
Response.Write "文章类别(包含类别中的文章)删除成功!"     
else
Response.Write "栏目类别删除失败!栏目不存在或者已删除!"  
%>
<%end if%>
<br/>----------<br/>
<a href='wzclass.asp?sid=<%=sid%>'>[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>