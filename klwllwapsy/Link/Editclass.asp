<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<card title="友链分类修改"><p>
<% dim rs,sql,id
id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
sql = "select * from linkclass where classid="&id
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此类别！<br/>"
else
%>
分类名称:<input name="class" value="<%=usb(rs("class"))%>" size="10"/><br/>
分类排序:<input name="pid" value="<%=rs("pid")%>" size="10"/><br/>
		分类换行:<select name="br" value="<%=rs("br")%>">
			<option value="1">自动换行</option>
			<option value="2">不换行</option>
			</select><br/>
<anchor>确认提交<go href="Editclasscl.asp?sid=<%=sid%>&amp;id=<%=id%>" method="post" accept-charset="utf-8">
<postfield name="class" value="$(class)"/>
<postfield name="pid" value="$(pid)"/>
<postfield name="br" value="$(br)"/>
</go></anchor><br/>
<%end if%><a href="Link_class.asp?sid=<%=sid%>">返回分类管理</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>返回友链后台</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml><%call ALLClose()%>


