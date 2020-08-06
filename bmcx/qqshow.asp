<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
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
<wml><card id="card1" title="QQ秀查看">
<p>
<%dim qq,sid
qq=Request.form("qq")
sid=Request.form("sid")
%>
<img src="http://qqshow-user.tencent.com/<%=qq%>/10/00/1.jpg" alt="pictureload"/><br/>
<a href="http://qqshow-user.tencent.com/$(qq)/11/00/1.jpg">下载小图</a><br/><a href="http://qqshow-user.tencent.com/$(qq)/10/00/1.jpg">下载大图</a><br/>
<br/>--自定义下载--<br/> 宽度:<input name="mx" type="text" maxlength="6" value="128" format="*N"/><br/>高度:<input name="my" type="text" maxlength="6" value="128" format="*N"/><br/>格式:<select name="ifmt" ivalue="1"><option value="jpg">jpg</option><option value="gif">gif</option><option value="png">png</option></select><br/>颜色:<select name="bw" ivalue="1"><option value="2">彩色</option><option value="1">黑白</option></select><br/><anchor>确定<go href="http://217.12.4.171/wimg" method="get"><postfield name="ifmt" value="$(ifmt)"/> <postfield name="mx" value="$(mx)"/><postfield name="my" value="$(my)"/><postfield name="bw" value="$(bw)"/><postfield name="furl" value="http://qqshow-user.tencent.com/$(qq)/10/00/1.jpg"/></go></anchor>
<br/>----------<br/>
<a href="qqs.asp?sid=<%=sid%>">返回查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>