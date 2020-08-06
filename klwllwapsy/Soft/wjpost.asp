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
<card title="文件修改">
<p>
<% id=request.QueryString("id")
 lid=request.QueryString("lid")
idd=request.querystring("idd") 
 name=request.form("name")
 laiy=request.form("laiy")  
 title=request.form("title")
        set rs=server.createobject("adodb.recordset")
	sql="select * from wjfile where id="&id
	rs.open sql,conn,3,3
        rs("name")=name
        rs("laiy")=laiy
        rs("title")=title
        rs.update
	 rs.close
	 set rs=nothing
         conn.Close
         set conn=Nothing 
        %>
修改文件成功!
<br/>----------<br/>
<a href="wjlist.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[文件列表]</a><br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件大类]</a><br/>
<a href="wzjl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>