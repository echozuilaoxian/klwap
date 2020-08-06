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
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="栏目分类删除">
<p>
<% dim rs,sql,lx,id,idd
id=Request.querystring("id")
idd=Request.querystring("idd")
lx=Request.querystring("lx")
set rs=server.CreateObject ("ADODB.Recordset") 
rs.open "Select * from class where classid="&id ,conn,2,3 
if not (rs.bof and rs.eof) then 
rs.delete  
rs.close
set rs=nothing
sql="delete from class Where parent="&id
conn.Execute(sql)
Response.Write "栏目类别(包含所有子栏目)删除成功!"     
else
Response.Write "栏目类别删除失败!栏目不存在或者已删除!"  
%>
<%end if%>
<br/>----------<br/>
<%if idd<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=idd%>&amp;lx=<%=lx%>">[栏目分类]</a><br/>
<%end if%>
<a href='class.asp?sid=<%=sid%>'>[栏目分类]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>