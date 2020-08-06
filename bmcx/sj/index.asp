<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'============================================================
' 更新: 2007/09/10
' 主页: qq.dxssb.cn 
' Q Q : 345123198
' 版权:  All Rights Reserved.
'============================================================
Call Head
%>
<%dim sid
sid=request.querystring("sid")
%>
<img src="bd.gif" alt="手机宝典"/><br/>
+手机玩家宝典<br/>								 
<a href='list.asp?listID=1&amp;sid=<%=sid%>'>评测评论</a> <br/>
<a href='list.asp?listID=2&amp;sid=<%=sid%>'>购机指南</a> <br/>
<a href='list.asp?listID=3&amp;sid=<%=sid%>'>实用技巧</a> <br/>
<a href='list.asp?listID=4&amp;sid=<%=sid%>'>手机bug</a> <br/>
<a href='list.asp?listID=5&amp;sid=<%=sid%>'>手机软件</a> <br/>
<a href='list.asp?listID=6&amp;sid=<%=sid%>'>游戏铃声</a> <br/>
<a href='list.asp?listID=0&amp;sid=<%=sid%>'>所有文章</a> <br/>
<%
Call Last
Sub Head 
    Response.ContentType = "text/vnd.wap.wml"
    Response.Write "<?xml version=""1.0"" encoding=""utf-8""?>"
    Response.Write "<!DOCTYPE wml PUBLIC ""-//WAPFORUM//DTD WML 1.1//EN"" ""http://www.wapforum.org/DTD/wml_1.1.xml"">"
    Response.Write "<wml>"
    Response.Write "<head>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""max-age=0""/>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""no-cache""/>"
    Response.Write "</head>"
    Response.Write "<card title=""手机玩家宝典"">"
    Response.Write "<p>"
End Sub
Sub Last
    Response.Write "-------------<br/>"
    Response.Write "<a href=""/bbs/index.asp?sid="&sid&""">社区论坛</a><br/>"
    Response.Write "<a href=""/index.asp?sid="&sid&""">返回首页</a><br/>"
    Response.Write "</p>"
    Response.Write "</card>"
    Response.Write "</wml>"
    Response.End
End Sub%>