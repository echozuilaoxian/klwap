<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<% if Session("Counter")="pass_numbers_55556666" then %>
<% wap=request.querystring("wap") %>
<card id="card1" title="�޸Ĺ���">  
<p>
��������:<input type="text" name="tt" maxlength="20"/><br/>
--------<br/>
��������:<input type="text" name="tt1" maxlength="200"/><br/>
������:<input type="text" name="tt2" maxlength="200"/><br/>
<anchor>�ύ
<go method="post" href='setcl1.asp?wap=<%=wap%>'>
<postfield name="tt" value="$(tt)"/>
<postfield name="tt1" value="$(tt1)"/>
<postfield name="tt2" value="$(tt2)"/>
</go>
</anchor>
<br/>------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>����������ҳ</a>
</p>
</card>
</wml>
<% end if %>



