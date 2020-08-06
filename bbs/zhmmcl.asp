<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn2.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="找回密码">
<p>
<%sjhm=request("sjhm")
if sjhm="" then sjhm="0"
set zhhpp=Server.CreateObject("ADODB.Recordset")
  ssqqll="select * from usereg where cstr(useklsj)="&sjhm
  zhhpp.open ssqqll,conn,1,1
if zhhpp.eof then
cww="对不起，没有该手机号的注册信息<br/>"
Else
mywt=usb(zhhpp("mmwt"))
end if
zhhpp.close
set zhhpp=nothing%>
<%if cww="" then%>
请输入您的答案来获取密码！<br/>
密码问题：<b><u><%=ubb(mywt)%></u></b><br/>
输入答案：<input name="wtda" emptyok="true" maxlength="250" value=""/><br/>
<anchor title="确定">下一步
<go href="mmcll.asp?sjhm=<%=sjhm%>" method="post" accept-charset='utf-8'>
<postfield name="myan" value="$(wtda)"/>
</go>
</anchor><br/>
<%else%>
<%=cww%>
<%end if%>
-----------<br/>
<a href="/BBS/yksm.asp">返回登陆界面</a>
<br/><a href="/bbs/index.asp">返回社区首页</a>
</p>
</card>
</wml>