<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="文件采集器" >
<p>
提示:采集大文件需用较长时间<br/>
文件地址:<input name='url' value='http://'/><br/>
<%Set Rs1 = Server.CreateObject("Adodb.Recordset")
	Sql1 = "SELECT name,lid from wjlist order by Lid desc"
	rs1.open sql1,conn,1,1
%>
选择类别:
<select name="lid">
<option value='0'>不选择</option>
<% do while not rs1.eof
%>
<option value='<%=rs1("lid")%>'><%=rs1("name")%></option>   
<%  rs1.movenext
        loop
%></select><br/>
<anchor>采集文件<go href='Getcl.asp?sid=<%=sid%>' method='post'>
<postfield name='url' value='$(url)'/>
<postfield name="lid" value="$(lid)"/>
</go></anchor>
<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>