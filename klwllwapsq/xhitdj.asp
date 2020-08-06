<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>

<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql = "select * from dj where id="&request("id")
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此道具!"
else
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='修改道具' >
<p>
道具名称：<%=rs("title")%><br/>
价格：<input name='jg' type='text' size='15' value='<%=rs("jg")%>'/><br/>
库存：<input name='sun' type='text' size='15' value='<%=rs("sun")%>'/><br/>
是否显示：<select name="bh">
				<option value="1">显示</option>
				<option value="2">隐藏</option>
				</select><br/>
<anchor>[-保存-]
<go href='xhitdjsave.asp?id=<%=request("id")%>&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='jg' value='$(jg)'/>
<postfield name='sun' value='$(sun)'/>
<postfield name='bh' value='$(bh)'/>
</go>
</anchor>
<br/>------------
<br/><a href='xhadmindj.asp?adminmid=<%=request("adminmid")%>'>返回道具管理</a>
<br/><a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
	end if
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing

%>