<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<card id="card1" title="<%=dlname%>-搜索文章">
<p><%=dlname%>搜索帖子<br/>---------<br/>
请输入搜索词:
<br/><input type='text' name='keyword'/>
<br/>选择搜索方式:
<br/><select name="finfrom" value="1">
<option value="1">按题目搜索</option>
<option value="2">按内容搜索</option>
</select>
<br/><anchor>提 交<go method='post' href='esscl.asp?SessionID=<%=SessionID%>'><postfield name='keyword' value='$(keyword)'/><postfield name='finfrom' value='$(finfrom)'/>
<postfield name='ForumID' value='<%=ForumID%>'/>
</go></anchor>
<br/><a href='/BBS/forum_content/Contentlist.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>'>返回<%=dlname%></a>
<br/><a href='/BBS/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



