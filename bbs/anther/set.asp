<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<% if Session("Counter")="pass_numbers_55556666" then %>
<% wap=request.querystring("wap") %>
<card id="card1" title="修改投票">  
<p>
调查主题:<input type="text" name="tt" maxlength="20"/><br/>
--------<br/>
&#35843;&#26597;&#39033; 1:<input type="text" name="tt1" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 2:<input type="text" name="tt2" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 3:<input type="text" name="tt3" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 4:<input type="text" name="tt4" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 5:<input type="text" name="tt5" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 6:<input type="text" name="tt6" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 7:<input type="text" name="tt7" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 8:<input type="text" name="tt8" maxlength="200"/><br/>
&#35843;&#26597;&#39033; 9:<input type="text" name="tt9" maxlength="200"/><br/>
&#35843;&#26597;&#39033;10:<input type="text" name="tt10" maxlength="200"/><br/>
&#35843;&#26597;&#39033;11:<input type="text" name="tt11" maxlength="200"/><br/>
&#35843;&#26597;&#39033;12:<input type="text" name="tt12" maxlength="200"/><br/>
&#35843;&#26597;&#39033;13:<input type="text" name="tt13" maxlength="200"/><br/>
&#35843;&#26597;&#39033;14:<input type="text" name="tt14" maxlength="200"/><br/>
&#35843;&#26597;&#39033;15:<input type="text" name="tt15" maxlength="200"/><br/>
&#35843;&#26597;&#39033;16:<input type="text" name="tt16" maxlength="200"/><br/>
&#35843;&#26597;&#39033;17:<input type="text" name="tt17" maxlength="200"/><br/>
&#35843;&#26597;&#39033;18:<input type="text" name="tt18" maxlength="200"/><br/>
<anchor>&#25552;&#32;&#20132;
<go method="post" href='setcl.asp?wap=<%=wap%>'>
<postfield name="tt" value="$(tt)"/>
<postfield name="tt1" value="$(tt1)"/>
<postfield name="tt2" value="$(tt2)"/>
<postfield name="tt3" value="$(tt3)"/>
<postfield name="tt4" value="$(tt4)"/>
<postfield name="tt5" value="$(tt5)"/>
<postfield name="tt6" value="$(tt6)"/>
<postfield name="tt7" value="$(tt7)"/>
<postfield name="tt8" value="$(tt8)"/>
<postfield name="tt9" value="$(tt9)"/>
<postfield name="tt10" value="$(tt10)"/>
<postfield name="tt11" value="$(tt11)"/>
<postfield name="tt12" value="$(tt12)"/>
<postfield name="tt13" value="$(tt13)"/>
<postfield name="tt14" value="$(tt14)"/>
<postfield name="tt15" value="$(tt15)"/>
<postfield name="tt16" value="$(tt16)"/>
<postfield name="tt17" value="$(tt17)"/>
<postfield name="tt18" value="$(tt18)"/>
</go>
</anchor>
<br/>------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
<br/>需要有一个或以上的调查项！
</p>
</card>
</wml>
<% end if %>



