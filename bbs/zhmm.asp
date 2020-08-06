<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="找回密码">
<p>
输入手机号获取问题！<br/>
手机号码<input name="sjhm" title="手机号：" type="text" format="*M" emptyok="true" maxlength="11" value=""/><br/>
<anchor>下一步
    <go href="zhmmcl.asp" method="post" accept-charset="utf-8">
        <postfield name="sjhm" value="$(sjhm)"/>
    </go>
</anchor><br/>
-----------<br/>
<a href="/BBS/UseLogin.asp">返回登陆界面</a>
<br/><a href="/bbs/index.asp">返回社区首页</a>
</p></card></wml>