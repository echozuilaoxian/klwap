<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title='发送邮件'>
<p><img src="mail.png" alt="."/><br/>
发送邮件和互联网一样免费<br/>
<%dim sid,IP
sid=trim(request("sid"))
if trim(request("TP"))="" then%>
你的用户名：<input name="name" maxlength="20"/><br/>
邮箱密码：<input name="pass" maxlength="50"/><br/>
你的邮箱：<input name="mail" maxlength="50" value="@"/><br/>
邮件主题：<input name="title" maxlength="50" value=""/><br/>
邮件内容：<input name="Content" maxlength="50" value=""/><br/>
签名：<input name="FromName" maxlength="50" value=""/><br/>
对方邮箱：<input name="tomail" maxlength="50" value="@"/><br/>
发送服务器：(如:smtp.163.com)<br/><input name="serveror" maxlength="50" value="smtp.163.com"/><br/>
<anchor>提交提交
<go href="Email.asp?Action=save" method="post" accept-charset='utf-8'>
<postfield name="name" value="$(name)"/>
<postfield name="pass" value="$(pass)"/>
<postfield name="mail" value="$(mail)"/>
<postfield name="title" value="$(title)"/>
<postfield name="Content" value="$(Content)"/>
<postfield name="sid" value="<%=sid%>"/>
<postfield name="FromName" value="$(FromName)"/>
<postfield name="tomail" value="$(tomail)"/>
<postfield name="serveror" value="$(serveror)"/>
<postfield name="TP" value="1"/>
</go>
</anchor><br/>
<%
else
dim name,pass,mail,title,Content,FromName,tomail,url,serveror
name=trim(request("name"))
pass=trim(request("pass"))
'url=trim(request("url"))
mail=trim(request("mail"))
title=trim(request("title"))
Content=trim(request("Content"))
FromName=trim(request("FromName"))
tomail=trim(request("tomail"))
serveror=trim(request("serveror"))
IF name="" or pass="" or mail="" or title="" or Content="" or FromName="" OR tomail="" or serveror="" then
  Response.write "各项都不能为空!" & chr(13)
  Response.write "<br/><a href=""/index.asp?sid="&sid&""">返回首页</a>" & chr(13)
  Response.write "</p></card></wml>"
  Response.end
end if
'IF url<>"" and url<>"http://" then
'if Instr(url,"twapp.cn")<=0 and Instr(url,"nowtx.cn")<=0 then
  'Response.write "附件资源地址只能是本站的!" & chr(13)
  'Response.write "<br/><a href=""/index.asp?sid="&sid&""">返回首页</a>" & chr(13)
  'Response.write "</p></card></wml>"
  'Response.end
'end if
'end if
Dim msg
Set msg = Server.CreateObject("JMail.Message")
msg.ContentType = "multipart/mixed"
msg.CharSet = "GB2312"
msg.FromName = FromName				'发件者的签名
msg.From = mail			'发件者邮箱
msg.ReplyTo = mail			'指定回复邮箱
msg.Subject = title					'邮件主题
msg.Body =Content & vbCrLf
msg.Body =msg.Body & "手机登录wap.nowtx.cn" & vbCrLf
msg.Body =msg.Body & "WAP基地无限精彩"	'邮件正文
'if url<>"" and url<>"http://" then
msg.AddAttachment(Server.MapPath("nowtx.jpg"))	'附件地址，必填
'end if
msg.AddRecipient tomail, "来自WAP.TWAPP.CN"		'收件人的邮箱、签名
msg.MailServerUserName = name		'自己邮箱的管理用户名
msg.MailServerPassword  = pass	'自己邮箱密码
msg.Send(serveror)				'发邮件服务器
msg.Close
Set msg = Nothing
response.Write "您的邮件已成功发送！<br/>"
response.Write "<a href='Email.asp?sid="&sid&"'>再写一篇</a><br/>"
end if
response.Write "<a href='mailhelp.asp?sid="&sid&"'>服务器设置</a><br/>"
response.Write "<a href='Bm.asp?sid="&sid&"'>便民中心</a><br/>"
response.Write "<a href='/index.asp?sid="&sid&"'>返回首页</a>"
response.Write "</p></card></wml>"
%>