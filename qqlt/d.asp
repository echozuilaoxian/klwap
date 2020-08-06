<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">


<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="修改好友备注"><p align="left">
<img src="qq.png" alt="Load" /><br />==修改好友备注==<br />您的好友是否经常更改昵称?是否有不知道对方是谁的时候?现在只要给对方写一个备注名,任凭他七十二变也逃不过我们的火眼金睛!<br />=修改QQ个性签名=<br />本系统方便在wap上修改QQ个性签名,显出你的个性!<br />使用方法:首先<a href="http://q9.3g.qq.com/g/s?sid=apjamjt==&amp;amp;aid=nqqchatMain">登陆3GQQ</a>登陆后提取sid码输入下面的框中 <br />输入sid码:<input name="s" value=""/><br/>输入要修改的QQ号码:<input name="n" value=""/><br/><anchor>修改备注<go method="get" href="http://q6.3g.qq.com/g/s?"><postfield name="sid" value="$(s)"></postfield><postfield name="aid" value="setting_friendmemo"></postfield><postfield name="u" value="$(n)"></postfield></go></anchor>||<anchor>修改签名<go method="get" href="http://q6.3g.qq.com/g/s?"><postfield name="sid" value="$(s)"></postfield><postfield name="aid" value="setting_signname"></postfield></go></anchor><br />----------<br/><anchor>返回上一级<prev/></anchor><br />----------<br/><a href="/index.asp">返回网站首页</a>
</p></card></wml>