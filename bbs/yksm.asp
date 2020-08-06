<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/410616.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
<!--#include FILE="md5.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card id="main" title="游客注册/登陆">
<p align="left">游客注册/登陆
<br/>手机号:<input name="sjhm" format="*N" size="12" maxlength="11"/>
<br/>密  码:<input type="password" name="pass" maxlength="100" size="12"/>
<br/><anchor>安全登陆<go method="post" href="/bbs/ltdlcl.asp"><postfield name="sjhm" value="$(sjhm)"/><postfield name="pass" value="$(pass)"/></go></anchor>|<anchor>一般登陆<go method="post" href="/bbs/ltdlcl1.asp"><postfield name="sjhm" value="$(sjhm)"/><postfield name="pass" value="$(pass)"/></go></anchor><br/>
安全登陆可以使以前书签失效
<br/><a href="/BBS/UseLogin.asp?Action=reg&amp;SessionID=guest000000000000000000001000009">免费注册</a>
<br/><a href="/BBS/zhmm.asp">找回密码</a>
<br/>-------------
<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a>
<br/>
</p>
</card>
</wml>



