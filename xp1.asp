<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<%
'============================================================
' 更新: 2009-2-11
' 主页: 本人小站xh6666.cn
' 电邮: xhbao.cn@qq.com
' Q Q : 762907090
' wap建站天堂xh6666.cn
'============================================================
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card id="main" title="未来相片查看">
<p>

<%
name=TRim(Request("name"))

%>

请输入你的姓名<br/><input name="name" title="" value="" emptyok="false" size="5"/><br/>
<anchor>点击查看<go href="xp1.asp" method="post">
<postfield name="name" value="$(name)"/>

</go></anchor><br/>

<%if name<>"" then%>你输入的姓名是[<%=name%>]<br/><img src="http://cn.miraino.jp/img/<%=name%>/" alt="<%=name%>"/><br/>
<a href="http://cn.miraino.jp/img/<%=name%>/">免费下载"<%=name%>"未来相片</a>

<%
end if
%>

<br/>---------<br/>
 wap建站天堂<br/>
本程序仅供娱乐<br/>
<a href="/">网站首页</a>
</p></card></wml>