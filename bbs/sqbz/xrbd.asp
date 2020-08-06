<% Response.ContentType="text/vnd.wap.wml" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-新人必读">
<p align="left">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
新人必读<br/>
----------<br/>
欢迎来<%=converttowidebaiti(SystemSiteName)%>，在这里你将能认识更多的新朋友从而得到很多意想不到的快乐。<br/>
<%=converttowidebaiti(SystemSiteName)%>拥有主题鲜明内容丰富的版块给大家互动交流，为了你在这里能得到最好的发挥，建议先到 <a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>我的地盘</a>修改好资料顺便选择一个最酷的个人形象，接下来您就可以到喜欢的<a href='/bbs/ztlb.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%>论坛</a>发帖交友啦!发帖前,建议先您阅读<a href='/bbs/sqbz/scgf.asp?SessionID=<%=SessionID%>'>社区规范</a>了解相关条例作为个人准则。<br/>
论坛拥有非常棒的发帖功能，您可以随时编辑文章直到您认为最佳效果,还可以无次数无限制地续写文章，成功发帖后在 没有加精及回复数低于50个 的情况下您可以自行删除，但一经加精或回复数大于50个 那就要版主才能删哦，“对大家 言行负责”，喜欢玩链接、贴图的朋友在发帖前请先看看<a href='/bbs/public/ftbz.asp?SessionID=<%=SessionID%>'>发帖帮助</a>那样贴起 图来会更美观方便。社区还为您的到来准备了多款娱乐方式放松一天的疲倦 为明天调节最佳状态，具体娱乐方式在各款游戏里都有详细说明，希望玩得愉快！<br/>
为了确保您的权益有空请看<a href='/bbs/public/bzgz.asp?SessionID=<%=SessionID%>'>版主规范</a>以便监督我们的工作，有任何问题需要帮助请直接 联系社区客服或版主，我们将竭力为您服务。谢谢!<br/>
---------------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>返回上级</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/>    
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>