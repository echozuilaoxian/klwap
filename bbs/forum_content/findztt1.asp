<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="搜索帖子">
<p>
<%wap=request.querystring("wap")%>
请输入搜索词:
<br/><input type='text' name='keyword'/>
<br/>选择搜索方式:
<br/><select name="finfrom" value="1">
<option value="1">按题目搜索</option>
<option value="2">按内容搜索</option>
</select>
<br/><anchor>提 交<go method='post' href='/bbs/xcbgs/findzttcl.asp?wap=<%=wap%>'><postfield name='keyword' value='$(keyword)'/><postfield name='finfrom' value='$(finfrom)'/></go></anchor>
<br/><a href='/bbs/ztlb.asp?wap=<%=wap%>'>社区论坛</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>
</p>
</card>
</wml>



