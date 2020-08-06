<%@LANGUAGE="VBScript" CODEPAGE="65001"%>
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
<card id="main" title="注册会员">
<p>
<%if cw="1" then%>
各项都要填写
<%elseif cw="2" then%>
为了您更好交流，请输入正确的手机号！
<%elseif cw="3" then%>
您输入的两次密码不一样！
<%elseif cw="4" then%>
该手机号已经被注册！
<%elseif cw="5" then%>
该昵称已经被使用！
<%end if%>
<%if cw<>"" then%>
<br/>-----------<br/>
<%end if%>
<b>手机号码</b><br/><input name="sjhm" title="手机号：" type="text" format="*M" emptyok="true" maxlength="11" value=""/><br/>
<b>密码</b><input name="dlmm" title="登陆密码" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<b>昵称</b><input name="ltnc" title="论坛昵称" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<b>性别</b><select name='xb' value='2'>
<option value="1">男性</option>
<option value="2">女性</option>
<option value="3">保密</option>
</select><br/>
<b>密码保护</b>(方便取回密码，必填)<br/>
密码问题<input name="mmwt" title="密码问题" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
密码答案<input name="wtda" title="密码答案" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<anchor>确定提交
    <go href="sgzcsave.asp" method="post" accept-charset="utf-8">
        <postfield name="sjhm" value="$(sjhm)"/>
        <postfield name="dlmm" value="$(dlmm)"/>
        <postfield name="ltnc" value="$(ltnc)"/>
        <postfield name="xb" value="$(xb)"/>
        <postfield name="mmwt" value="$(mmwt)"/>
        <postfield name="wtda" value="$(wtda)"/>
    </go>
</anchor><br/>
----------<br/>
<b>由于移动取消发送手机号码，无法实现自动注册，请手工注册，每个会员仅限注册一个ID，发现会员注册多个号，系统会自动封锁该号！</b><br/>
<a href="login.asp">返回登陆</a>

<br/><a href="/">返回首页</a>
</p></card></wml>