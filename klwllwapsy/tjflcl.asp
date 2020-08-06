<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim pp,id,idd,lxl
id=request.QueryString("id")
 idd= request.QueryString("idd")
 lxl= request.QueryString("lxl")
if id="" then id=0
pp=request.QueryString("pp")
if pp="" then pp=1
%>
<%if pp=0 then%>
<card title="添加新的页面">
<p>输入页面名称:<br/><input name="class1" title="名称" emptyok="false"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
栏目后面:
		<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
模拟器访问:<select name="opera" value="1">
			<option value="1">开启</option>
			<option value="2">禁止</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='0'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
        <postfield name='opera' value='$(opera)'/>
    </go>
</anchor>
<%elseif pp=1 then%>
<card title="添加文章类别">
<p>文章类别名称:<br/>
<%
set rs=server.createobject("adodb.recordset")
	sql="select * from wzclass"
	rs.open sql,conn,1,1
%><input name="class1" title="名称" value=""/><br/>
选择类别:
<select name="lid">
<% do while not rs.eof
%> <option value='<%=rs("classid")%>'><%=rs("class")%></option>   
<%  rs.movenext
        loop
%></select><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name="lid" value="$(lid)"/>
        <postfield name='lx' value='1'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=2 then%>
<card title="添加UUB标签">
<p><a href="ubbcl.asp?sid=<%=sid%>">[UBB说明]</a><br/>
输入UUB标签:<br/><input name="class1" title="名称" emptyok="false"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='2'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=3 then%>
<card title="添加直接显图">
<p>输入显图名称<br/><input name="class1" title="名称" emptyok="false"/><br/>
输入图片地址:<br/><input name="img" title="名称" emptyok="false"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="img" value="$(img)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='3'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=4 then%>
<card title="添加超级链接">
<p>输入超链名称:<br/><input name="class1" title="名称" value=""/><br/>
   输入超链地址:<br/><input name="URL" title="名称" value="http://"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="URL" value="$(URL)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='4'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=5 then%>
<card title="添加WML标签">
<p>输入WML标签内容:<br/><input name="class1" title="名称" emptyok="false"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='5'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=6 then%>
<card title="添加文件类别">
<p>文件类别名称:<br/>
<%
set rs1=server.createobject("adodb.recordset")
	sql1="select * from wjclass"
	rs1.open sql1,conn,1,1
%><input name="class1" title="名称" value=""/><br/>
选择类别:
<select name="lid">
<% do while not rs1.eof
%> <option value='<%=rs1("id")%>'><%=rs1("name")%></option>   
<%  rs1.movenext
        loop
%></select><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name="lid" value="$(lid)"/>
        <postfield name='lx' value='7'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=7 then%>
<card title="添加调用栏目">
<p>调用栏目名称<br/><input name="class1" title="名称" emptyok="false"/><br/>
选择调用栏目<br/><select name="lx">
<option value="10">最新文章</option>
<option value="11">最热文章</option>
<option value="12">随机文章</option>
</select><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="img" value="$(img)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='$(lx)'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%elseif pp=8 then%>
<card title="添加随机广告">
<p>广告标题(用于后台标识):<br/><input name="class1" title="名称" emptyok="false"/><br/>
显示方式:<select name="active" value="0"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br" value="1">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid" type="text" value="5" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="classsave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1)"/>
         <postfield name="pid" value="$(pid)"/>
        <postfield name="br" value="$(br)"/>
        <postfield name='lx' value='8'/>
        <postfield name='parent' value='<%=id%>'/>
        <postfield name='active' value='$(active)'/>
    </go>
</anchor>
<%end if%>
<br/>----------<br/>
<%if id<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lxl=<%=lxl%>">[栏目分类]</a><br/>
<%end if%>
<a href="class.asp?sid=<%=sid%>">[栏目管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
