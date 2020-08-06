<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<card id="index" title="申请友链"><p>
<a href='Link_about.asp'>合作须知>></a><br/>
网站名称:<br/><input name="NAME<%=minute(now)%><%=second(now)%>" value=""/><br/>
网站简称:<br/><input name="NAMT<%=minute(now)%><%=second(now)%>" maxlength="2" value=""/><br/>
网站地址：<br/><input name="URL<%=minute(now)%><%=second(now)%>" title="名字" value="http://"/><br/>
网站分类：<select name="classID<%=minute(now)%><%=second(now)%>">
<%
Set Rs=server.createobject("adodb.recordset")
Sql = "select [classid],[class] from [linkclass]"
Rs.open Sql,conn,1,1
        do while not Rs.eof
%><option value='<%=rs("classID")%>'><%=rs("class")%></option>
<%
        rs.movenext
        Loop
%></select><br/>
网站简介：(50字内)<br/><input name="JIAN<%=minute(now)%><%=second(now)%>" title="简介"  value=""/><br/><anchor>确定提交<go href="Post.asp?hk=<%=hk%>" method="post" accept-charset="utf-8">
<postfield name="NAME" value="$(NAME<%=minute(now)%><%=second(now)%>)"/>
<postfield name="NAMT" value="$(NAMT<%=minute(now)%><%=second(now)%>)"/>
<postfield name="URL" value="$(URL<%=minute(now)%><%=second(now)%>)"/>
<postfield name="Classid" value="$(classID<%=minute(now)%><%=second(now)%>)"/>
<postfield name="JIAN" value="$(JIAN<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<%call lasts()%>
<%call allClose()%>