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
<card title="上传设置">
<p>
<%
lid=request.querystring("lid")
set rs=server.createobject("adodb.recordset")
sql="select format,size from twapp"
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "出错了！<br/>"
end if
%>
文件上传格式(多个用,隔开)<br/>
<input name="format" value="<%=rs("format")%>"/><br/>
文件上传大小(单位KB)<br/>
<input name="size" value="<%=rs("size")%>"/><br/>
<anchor>确认修改
    <go href="wjsqcl.asp?sid=<%=sid%>&amp;lid=<%=lid%>" method="post" accept-charset="utf-8">
        <postfield name="format" value="$(format)"/>
         <postfield name="size" value="$(size)"/>
    </go>
</anchor><br/>----------<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>