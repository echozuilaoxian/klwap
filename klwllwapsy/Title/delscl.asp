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
<card title="文章删除结果">
<p>
<% dim rs,sql,id
   id=int(request.QueryString("id"))
   classid=int(request.QueryString("classid"))
   set rs=server.CreateObject ("ADODB.Recordset") 
rs.open "Select * from sms where id="&id ,conn,2,3  
If Not rs.eof	Then
rs.delete  
Response.Write "文章删除成功!" 
else
Response.Write "文章删除失败!可能已删除或者文章不存在" 
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>
<br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[文章列表]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>&amp;id=<%=id%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>