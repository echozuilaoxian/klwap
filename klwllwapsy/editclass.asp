<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<%pp=request.querystring("lx")
id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
sql = "select * from class where classid="&id
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	notclass
else
classright
end if
%>
<%sub classright()%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml><%
if pp=10 then classname="最新文章"
if pp=11 then classname="最热文章"
if pp=12 then classname="随机文章"
if pp=13 then classname="最新文件"
if pp=14 then classname="最热文件"
if pp=15 then classname="随机文件"
if pp=16 then classname="最新贴子"
if pp=17 then classname="最热贴子"
if pp=18 then classname="随机贴子"
if pp=0 then classname="新的页面"
if pp=1 then classname="文章菜单"
if pp=2 then classname="文字类型"
if pp=3 then classname="图片显示"
if pp=4 then classname="超级链接"
if pp=5 then classname="WML标签"
if pp=7 then classname="文件栏目"
if pp=8 then classname="随机广告"%>
<%if pp=0 then %>
<card title="编辑页面菜单">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>
请输入新页面名称<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
模拟器访问:<select name="opera<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("opera"))%>">
			<option value="1">开启</option>
			<option value="2">禁止</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='0'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='opera' value='$(opera<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=1 then%>
<card title="编辑文章栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>
请输入新栏目名称<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='1'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=2 then%>
<card title="编辑文字类别">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>请输入新文字段落<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='2'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=3 then%>
<card title="编辑直接显图">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>请输入新显图名称<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
图片地址:<input name="img<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("img"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="img" value="$(img<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='3'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=4 then%>
<card title="编辑超级链接">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>请输入新超链名称:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>"/><br/>
   输入新超链地址:<br/><input name="URL<%=minute(now)%><%=second(now)%>" title="名称" size="10" value="<%=ubb1(rs("url"))%>"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="URL" value="$(URL<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='4'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=5 then%>
<card title="修改WML标签">
<p>
        类型:<%=classname%><br/>输入新WML标签内容:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='5'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=7 then%>
<card title="编辑文件栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新文件栏目名字:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='7'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=8 then%>
<card title="编辑随机广告">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新广告名称(用于后台标识):<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="URL" value="$(URL<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='lx' value='8'/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
    </go>
</anchor>
<%elseif pp=10 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='10'/>
    </go>
</anchor>
<%elseif pp=11 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='11'/>
    </go>
</anchor>
<%elseif pp=12 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='12'/>
    </go>
</anchor>
<%elseif pp=13 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='13'/>
    </go>
</anchor>
<%elseif pp=14 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='14'/>
    </go>
</anchor>
<%elseif pp=15 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='15'/>
    </go>
</anchor>
<%elseif pp=16 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='16'/>
    </go>
</anchor>
<%elseif pp=17 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='17'/>
    </go>
</anchor>
<%elseif pp=18 then%>
<card title="编辑调用栏目">
<p>名称:<%=ubb1(rs("class"))%><br/>
        类型:<%=classname%><br/>新调用栏目名:<br/><input name="class1<%=minute(now)%><%=second(now)%>" title="名称" value="<%=ubb1(rs("class"))%>" emptyok="false"/><br/>
显示方式:<select name="active<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("active"))%>"><option value="0">正常显示</option><option value="1">隐藏显示</option></select><br/>
		栏目后面:<select name="br<%=minute(now)%><%=second(now)%>" value="<%=ubb1(rs("br"))%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
显示顺序:<input name="pid<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("pid"))%>" format="*N" size="2" emptyok="false"/><br/>
<anchor>确认提交
    <go href="editclasssave.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="class1" value="$(class1<%=minute(now)%><%=second(now)%>)"/>
         <postfield name="pid" value="$(pid<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="br" value="$(br<%=minute(now)%><%=second(now)%>)"/>
        <postfield name='active' value='$(active<%=minute(now)%><%=second(now)%>)'/>
        <postfield name='lx' value='18'/>
    </go>
</anchor>
<%end if%>
<br/>----------<br/>
<% if rs("parent")<>0 then %>
<a href='Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=pp%>'>[栏目分类]</a><br/>
<%end if%>
<a href='class.asp?sid=<%=sid%>'>[栏目分类]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml><%Response.End%><%End Sub%>
<%sub notclass()%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" "http://www.wapforum.org/DTD/wml13.dtd">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="出错了">
<p align="left">
没有这个栏目!
<br/>----------<br/>
<a href='class.asp?sid=<%=sid%>'>返回栏目管理</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml><%Response.End%><%End Sub%>

