<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<% dim rs,sql,p
p=request.Querystring("p")
if p="" then p=1
set rs=server.CreateObject("adodb.recordset")
				sql="select * from link_admin"
				rs.open sql,conn,1,3 %>
<%if p=1 then%><card id="index" title="友链设置"><p>
友链名称:<input name="title<%=minute(now)%><%=second(now)%>" type="text" value="<%=usb(rs("title"))%>" maxlength="255"/><br/>
		友链Logo:<input  name="logo<%=minute(now)%><%=second(now)%>" type="text" value="<%=usb(rs("logo"))%>" maxlength="255"/><br/>
		友链网址(请填写的你网站地址):<br/><input  name="URLL<%=minute(now)%><%=second(now)%>" type="text" value="<%=usb(rs("URLL"))%>"/><br/>
审核设置:
<select name="Active<%=minute(now)%><%=second(now)%>" value="<%=rs("Active")%>">
<option value="1">必须审核</option>
<option value="0">不用审核</option>
</select><br/>                       
<anchor>保存修改<go href="admin_config.asp?sid=<%=sid%>&amp;p=2" method="post">
<postfield name="logo" value="$(logo<%=minute(now)%><%=second(now)%>)" />
<postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)" />
<postfield name="URLL" value="$(URLL<%=minute(now)%><%=second(now)%>)" />
<postfield name="Active" value="$(Active<%=minute(now)%><%=second(now)%>)" />
</go></anchor><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
<%elseif p=2 then%>
<card id="index" title="网站设置结果"><p>
<%
title=Request.Form("title")
URLL=Request.Form("URLL")
logo=Request.Form("logo")  
Active=Request.Form("Active")   
if title=""  then 
Response.Write "网站名称不能为空!<br/>"
else
set rs=server.CreateObject("adodb.recordset")
sql="select * from link_admin"
rs.open sql,conn,1,3
if not (rs.bof and rs.eof) then
rs("title")=title
rs("URLL")=URLL
rs("logo")=logo 
rs("Active")=Active                                       
	rs.update()
Response.Write "成功设置！<br/>"
end if			
end if	%>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
<%END IF%>
</p></card></wml>
<%call ALLClose()%>