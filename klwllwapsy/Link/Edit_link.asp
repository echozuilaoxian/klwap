<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<%id=request.Querystring("id")
classs=request.Querystring("class")
if id<>1 then
dim rs,sql,p
p=request.Querystring("p")
if p="" then p=1
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select * from [link] Where ID="&ID
Rs.open Sql,conn,2,3%>
<%if p=1 then%><card title="友链修改"><p>
友链名称:<input name="name<%=minute(now)%><%=second(now)%>" value="<%=usb(rs("name"))%>"/><br/>
友链简称:<input name="namt<%=minute(now)%><%=second(now)%>" value="<%=usb(rs("namt"))%>"/><br/>
网站地址:<input name="url<%=minute(now)%><%=second(now)%>" value="<%=usb(rs("url"))%>"/><br/>
网站简介:<input name="jian<%=minute(now)%><%=second(now)%>" value="<%=usb(rs("jian"))%>"/><br/>
<anchor>修改友链
<go href="Edit_link.asp?sid=<%=sid%>&amp;class=<%=classs%>&amp;id=<%=id%>&amp;p=2" method="post" accept-charset="utf-8">
<postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/>
<postfield name="namt" value="$(namt<%=minute(now)%><%=second(now)%>)"/>
<postfield name="url" value="$(url<%=minute(now)%><%=second(now)%>)"/>
<postfield name="jian" value="$(jian<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<a href="Admin_class.asp?sid=<%=sid%>&amp;id=<%=classs%>&amp;p=2">[友链管理]</a><br/>
<a href="Link_class.asp?sid=<%=sid%>">[分类管理]</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>   
<%elseif p=2 then%>
<card id="index" title="友链修改结果"><p>  
<% dim name,url,jian,namt
name=Request.Form("name")
namt=Request.Form("namt")
URL=Request.Form("URL")
jian=Request.Form("jian")    
if name=""  then 
Response.Write "网站名称不能为空!<br/>"
else
if not (rs.bof and rs.eof) then
rs("name")=name
rs("namt")=namt
rs("URL")=URL
rs("jian")=jian                                       
	rs.update()
Response.Write "成功修改友链！<br/>"			
end if	
end if
%>
<a href="Admin_class.asp?sid=<%=sid%>&amp;id=<%=classs%>">返回友链管理</a><br/>
<a href="Link_class.asp?sid=<%=sid%>">返回分类管理</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>返回友链后台</a>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml><%END IF%><%call ALLClose()%>
<%else%>
<card title="不能修改"><p>
程序作者友链@_@建站空间版权所有!<br/>
<a href="Admin_class.asp?sid=<%=sid%>&amp;id=<%=classs%>">[友链管理]</a><br/>
<a href="Link_class.asp?sid=<%=sid%>">[分类管理]</a><br/>
<a href='Admin_index.asp?sid=<%=sid%>'>[友链后台]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml><%end if%>