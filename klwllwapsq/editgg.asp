<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<%
set rs=server.createobject("adodb.recordset")
sql = "select * from gogo where id="&request("id")
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "无此广告!"
else
end if
%>
<card id='main' title='修改广告' >
<p>广告名称：<input name='name' type='text' size='20' value='<%=rs("name")%>'/>
<br/>广告地址：<input name='url' type='text' size='20' value='<%=rs("url")%>'/>
<br/><anchor>确定修改
<go href='editggsave.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=request("id")%>' method='post' accept-charset='utf-8'>
<postfield name='name' value='$(name)'/>
<postfield name='url' value='$(url)'/>
</go>
</anchor>
<br/>------------
<br/><a href='admingg.asp?adminmid=<%=request("adminmid")%>'>返回广告管理</a>
<br/><a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>