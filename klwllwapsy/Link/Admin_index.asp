<!--#include file="Head.asp"-->
<%

%>
<!--#include file="Config.asp"-->
<!--#include file="../admin.asp"-->
<card title="友链管理">
<p align="left"><img src="/IMG/7.gif" alt='友链管理'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>
<a href="Admin_Config.asp?sid=<%=sid%>">[友链设置]</a><br/>
<a href="Link_class.asp?sid=<%=sid%>">[友链分类]</a><br/>
<a href="Link_add.asp?sid=<%=sid%>">[添加类别]</a><br/>
<a href="Admin_link.asp?sid=<%=sid%>">[友链审核]</a><br/>
<a href="links_good.asp?sid=<%=sid%>">[网站排行]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>