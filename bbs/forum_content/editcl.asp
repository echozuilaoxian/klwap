<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="搜索文章">
<p>
<%SessionID=request.querystring("SessionID")%>
请输入用户ID:
<br/><input type='text' name='id' format="*N"/>
<br/><anchor>提 交<go method='post' href='/BBS/forum_content/tdzt.asp?SessionID=<%=SessionID%>'><postfield name='id' value='$(id)'/><postfield name='finfrom' value='1'/></go></anchor>
<br/><a href='/bbs/ztlb.asp?SessionID=<%=SessionID%>'>返回论坛</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



