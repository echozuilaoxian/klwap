<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>


<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn2.asp" -->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='添加聊天室' >
<p>聊天室ID：<input name='id' type='text' size='10'/>切勿与已有的聊室ID相同<br/><br/>
聊天室名称：<input name='roomname' type='text' size='10'/><br/>
<br/><anchor>[-保存-]
<go href='formltgsave.asp' method='post' accept-charset='utf-8'>
<postfield name='roomname' value='$(roomname)'/>
<postfield name='idd' value='$(id)'/>
</go>
</anchor>
<br/>------------
<br/><a href='addltgform.asp'>添加聊天室</a>
<br/><a href='adminltgform.asp'>聊天室管理</a>
<br/>
<anchor>返回上级<prev/></anchor>
<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
