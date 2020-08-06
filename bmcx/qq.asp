<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>  
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>    
 <%dim sid
sid=request.querystring("sid")
%>
<card title="QQ专区"><p align="left">
<img src="/img/qq.png" alt=""/><br/>
WAP*QQ聊天[免费]<br/>
<img src="/img/qq1.gif" alt=""/><br/>
QQ号码:<input format="*N" type="text" name="qid" value=""/><br/>
QQ密码:<input format="*m" type="password" name="pw" value=""/><br/>
QQ状态:<select name="mode"><option value="Normal">正常</option><option value="Invisible">隐身</option></select><br/>
<anchor>普通登录
        <go href="http://wap.ejoint.net/perl/qq.cgi?act=login&amp;qid=$(qid)&amp;pw=$(pw)&amp;mode=$(mode)" method="get">
        </go>
</anchor><br/>
<anchor>安全登录
        <go href="https://wap.ejoint.net/qq/login.php" method="post">
		<postfield name="qid" value="$(qid)"/>
		<postfield name="pw" value="$(pw)"/>
		<postfield name="mode" value="$(mode)"/>
        </go>
</anchor><br/><a href='qqs.asp?sid=<%=sid%>'>查看QQ秀</a><br/>
-----------<br/><a href='/index.asp?sid=<%=sid%>'>返回首页</a>

</p>
</card>
</wml>