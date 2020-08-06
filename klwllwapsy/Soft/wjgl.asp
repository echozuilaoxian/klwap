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
<card title="文件管理">
<p>
<%
lid=request.querystring("lid")
id=request.querystring("id")
idd=request.querystring("idd")
set rs=server.createobject("adodb.recordset")
sql = "select * from wjfile where id="&id
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此类别！<br/>"
end if
response.write "标题:"&ubb(rs("name"))&"<br/>"
response.write "来源:"&ubb(rs("laiy"))&"<br/>"
response.write "文件地址:"&ubb(rs("URL"))&"<br/>"
if rs("pic")<>"" then
response.write "图片地址:"&ubb(rs("pic"))&"<br/>"
else
response.write "图片地址:暂无图片<br/>"
end if
response.write "添加日期:"&ubb(rs("time"))&"<br/>"
response.write "人气:"&ubb(rs("hit"))&"<br/>"
%>
----------<br/>
<a href='edits.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>'>[编辑文件]</a><br/>
<a href="delwj.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[删除文件]</a><br/>
<a href="move.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[移动文件]</a><br/>
<a href='wjlist.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>'>[文件列表]</a><br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件大类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
<%rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</p>
</card>
</wml>