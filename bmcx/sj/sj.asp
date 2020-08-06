<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<% 
'============================================================
' 更新: 2007-10-15
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%dim sid
sid=request.querystring("sid")
%>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card id="main" title="手机号码归属地查询"><p>
请输入手机号码
<input title="phone" name="phone" value="" format="*N" maxlength="11"/><br/>
<anchor><go href="phonecard.asp?sid=<%=sid%>&amp;phone=$(phone)" method="get">
</go>查询</anchor><br/>
---------<br/>
<a href="/bm/bm.asp?sid=<%=sid%>">便民查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>
