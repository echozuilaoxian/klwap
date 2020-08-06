<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='添加广告' >
<p>
广告名称：<input name='name' type='text' size='10'/><br/>
广告地址：<input name='url' type='text' size='10' value='http://'/><br/>
<anchor>确定添加
<go href='ggsave.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='name' value='$(name)'/>
<postfield name='url' value='$(url)'/>
</go>
</anchor>
<br/>------------<br/><a href="Admingg.asp?adminmid=<%=request("adminmid")%>">返回广告管理</a>
<br/><a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>