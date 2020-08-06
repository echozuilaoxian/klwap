<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="ccnn.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
gfdsa=Session("ltname")
id=request.QueryString("id")
p=request("p")
%>
<card title="发表评论"><p>
内容:<input name="retext<%=minute(now)%><%=second(now)%>" title="评论内容" type="text" maxlength="150" size="6"/>
<br/>
<anchor>提交回复
    <go href="saveok.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;ids=<%=ids%>&amp;p=<%=p%>" method="post" accept-charset="utf-8">
        <postfield name="rename" value="<%=gfdsa%>ID:<%=iduse%>"/>
        <postfield name="retext" value="$(retext<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
----------<br/>
<a href="relist.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">评论列表</a><br/>
<a href="view.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">返回案件</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;p=<%=p%>">案件分类</a><br/>
<!--#include file="aa.asp"-->
<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>