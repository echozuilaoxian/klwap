<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!-- #include file="conn.asp" -->
<!-- #include file="admin.asp" -->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="网站后台">
<p align="left"><img src="/IMG/ADMIN.gif" alt='WAP建站平台'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%>
<br/>
<a href="class.asp?sid=<%=sid%>">设计中心</a>.<a href="config.asp?sid=<%=sid%>">基本设置</a><br/>
<a href="admin_user.asp?sid=<%=sid%>">修改帐号</a>.<a href="zrcl.asp?sid=<%=sid%>">注入管理</a><br/>
<a href="soft/wjclass.asp?sid=<%=sid%>">分类管理</a>.<a href="soft/tjwj.asp?sid=<%=sid%>">添加分类</a> <br/>
<a href="soft/adminpin.asp?sid=<%=sid%>">评论管理</a>.<a href="soft/wjsq.asp?sid=<%=sid%>">上传设置</a> <br/>
<a href="soft/get.asp?sid=<%=sid%>">文件采集</a>.<a href="soft/up.asp?sid=<%=sid%>">上传文件</a><br/>
<a href="yunm.asp?sid=<%=sid%>">网页采集</a>.<a href="fileman.asp?sid=<%=sid%>">管理文件</a><br/>
<a href="title/wzcl.asp?sid=<%=sid%>">文章栏目</a>.<a href="soft/wjcl.asp?sid=<%=sid%>">文件栏目</a><br/>
<a href="title/wzclass.asp?sid=<%=sid%>">栏目管理</a>.<a href="title/tjwz.asp?sid=<%=sid%>">添加栏目</a> <br/>
<a href="title/adminpl.asp?sid=<%=sid%>">评论管理</a>.<a href="title/wzsq.asp?sid=<%=sid%>">上传开关</a> <br/><b>社区管理为独立后台</b>
<br/><a href="/klwllwapsq/t22t.asp?sid=<%=sid%>">社区管理</a>.<a href="ly/admin_ly.asp?sid=<%=sid%>">留言管理</a><br/>
<a href="iptj.asp?sid=<%=sid%>">流量统计</a>.<a href="yunm.asp?sid=<%=sid%>">站长工具</a><br/>
<a href="ubbcl.asp?sid=<%=sid%>">ubb说明</a>.<a href="link/admin_index.asp?sid=<%=sid%>">友链管理</a><br/>                            <a href="Sid.asp?sid=<%=sid%>">安全退出</a>.<a href="/index.asp">网站首页</a><br/>
<!--#include file="bq.gif"-->

</p>
</card>
</wml>