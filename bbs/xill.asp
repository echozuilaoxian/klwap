<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper" or browsers="winw" or browsers="wap/" or browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or  browsers="mozi" or browsers="mozi"  or browsers="m3ga" then
response.redirect "http://t.kong.net/wm/proxy/book.jsp?6226"
response.end
end if 
%>
<card id="main" title="页面加载中....." onenterforward="http://xh6666.cn">
<p>
<a href="http://xh6666.cn">点击进入.....</a>
</p></card></wml>










