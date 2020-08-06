<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<%dim sid
sid=request.querystring("sid")
%>
<card id="card1" title="QQ秀查看">
<p><img src="/img/qq.png" alt="手机QQ乐园"/><br/>
请输入QQ号码<br/><input name="qq" format="*N" title="" maxlength="10"/>
<br/><anchor>查看QQ秀<go method="post" href='qqshow.asp?qq=$(qq)'><postfield name="qq" value="$(qq)"/><postfield name="sid" value="$(sid)"/></go></anchor>
<br/><br/>
<a href="qq.asp?sid=<%=sid%>">QQ专区</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>