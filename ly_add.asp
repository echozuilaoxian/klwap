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
<!-- #include file="conn.asp" -->
<card title="发表留言">
<p>用户昵称(必填)：<br/>
<input name="name" title="用户昵称" type="text" format="*M" emptyok="true" maxlength="10"/><br/>
留言标题(必填)：<br/>
<input name="title" title="留言标题" type="text" format="*M" emptyok="true" maxlength="20"/><br/>
留言内容(必填,支持UBB)：<br/>
<input name="text" title="留言内容" type="text" format="*M" emptyok="true" maxlength="500"/><br/>
留言表情：<br/>
<select title="留言表情" name="face" value="0">
<option title="无" value="0">无</option>
<option title="微笑" value="1">微笑</option>
<option title="哭泣" value="2">哭泣</option>
<option title="调皮" value="3">调皮</option>
<option title="脸红" value="4">脸红</option>
<option title="害羞" value="5">害羞</option>
<option title="生气" value="6">生气</option>
<option title="偷笑" value="7">偷笑</option>
<option title="流汗" value="8">流汗</option>
<option title="我倒" value="9">我倒</option>
<option title="得意" value="10">得意</option>
<option title="眦牙" value="11">眦牙</option>
<option title="疑问" value="12">疑问</option>
<option title="睡觉" value="13">睡觉</option>
<option title="好色" value="14">好色</option>
<option title="口水" value="15">口水</option>
<option title="敲头" value="16">敲头</option>
<option title="可爱" value="17">可爱</option>
<option title="猪头" value="18">猪头</option>
<option title="YEAH" value="19">YEAH</option>
<option title="玫瑰" value="20">玫瑰</option>
</select><br/>
联系方式(隐藏)：<br/>
<input name="lianxi" title="联系方式" type="text" format="*M" emptyok="true" maxlength="50"/><br/>
留言性质：<br/>
<select title="留言性质" name="open">
<option title="公开留言" value="0">公开留言</option>
<option title="悄悄话" value="1">悄悄话</option>
</select><br/>
查看密码(悄悄话必填!)：<br/>
<input name="mm" title="联系方式" type="text" format="*M" emptyok="true" maxlength="50"/><br/>
<anchor>[-提交-]
    <go href="ly_save.asp?hk=<%=hk%>" method="post" accept-charset="utf-8">
        <postfield name="name" value="$(name)"/>
        <postfield name="title" value="$(title)"/>
        <postfield name="text" value="$(text)"/>
        <postfield name="face" value="$(face)"/>
        <postfield name="lianxi" value="$(lianxi)"/>
        <postfield name="open" value="$(open)"/>
        <postfield name="mm" value="$(mm)"/>
    </go>
</anchor><br/>
－－－－－<br/>
<a href="ly.asp?hk=<%=hk%>">留言首页</a><br/>
<a href="/index.asp?hk=<%=hk%>">返回首页</a><br/>
</p>
</card>
</wml>