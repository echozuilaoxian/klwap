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
<card title="文件修改">
<p>
<% id=request("id")
    lid=request("lid")
idd=request.querystring("idd")
        set rs = server.createobject("adodb.recordset")
	sql="select * from wjfile where id="&id
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	response.write "文件不存在<br/>"
	else
  response.write " 文件详情:  <br/>"
end if%>
标题: <%=ubb(rs("name"))%><br/>
来源: <%=ubb(rs("laiy"))%><br/>
地址: <%=ubb(rs("URL"))%><br/>
添加日期: <%=ubb(rs("time"))%><br/>
人气: <%=ubb(rs("hit"))%>
<br/>----------<br/>
标题:<input name="name<%=minute(now)%><%=second(now)%>" value="<%=ubb(rs("name"))%>"/><br/>
来源:<input name="laiy<%=minute(now)%><%=second(now)%>" value="<%=ubb(rs("laiy"))%>"/><br/>
文件说明:<input name="title<%=minute(now)%><%=second(now)%>" value="<%=rs("title")%>"/><br/>
<anchor>修改文件
    <go href="wjpost.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>" method="post" accept-charset="utf-8">
        <postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="laiy" value="$(laiy<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor>     
<%
rs.close
set rs=nothing
%>
<br/>----------<br/>
<a href="wjlist.asp?sid=<%=sid%>&amp;lid=<%=lid%>&amp;idd=<%=idd%>">[文件列表]</a><br/>
<a href='wjdl.asp?sid=<%=sid%>&amp;idd=<%=idd%>'>[文件小类]</a><br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件大类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>