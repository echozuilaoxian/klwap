<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<% if Session("Counter")="pass_numbers_55556666" then %>
<% wap=request.querystring("wap") %>
<card id="card1" title="修改公告">  
<p>
公告主题:<input type="text" name="tt" maxlength="20"/><br/>
--------<br/>
公告内容:<input type="text" name="tt1" maxlength="200"/><br/>
发布人:<input type="text" name="tt2" maxlength="200"/><br/>
<anchor>提交
<go method="post" href='setcl1.asp?wap=<%=wap%>'>
<postfield name="tt" value="$(tt)"/>
<postfield name="tt1" value="$(tt1)"/>
<postfield name="tt2" value="$(tt2)"/>
</go>
</anchor>
<br/>------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>返回社区首页</a>
</p>
</card>
</wml>
<% end if %>



