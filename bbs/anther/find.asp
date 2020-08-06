<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="&#37038;&#32534;&#21306;&#21495;">
<p>
<% wap=request.querystring("wap") %>
请输入关键词:
<br/><input type='text' name='keyword'/>
<br/><anchor>提 交<go method='post' href='findcl.asp?wap=<%=wap%>'><postfield name='keyword' value='$(keyword)'/></go></anchor>
<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>服务广场</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p></card></wml>

