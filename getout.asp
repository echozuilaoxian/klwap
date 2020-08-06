<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="非法操作">
<p>
<%o=request.querystring("o")
if o=1 then
%>
非法操作！<br/>
操作ＩＰ：<%=Request.ServerVariables("REMOTE_ADDR")%><br/>
操作时间：<%=Now%><br/>
提交方式：ＰＯＳＴ<br/>
您的ＩＰ已被记录，请自重！！！
<%elseif o=2 then%>
非法操作！<br/>
操作ＩＰ：<%=Request.ServerVariables("REMOTE_ADDR")%><br/>
操作时间：<%=Now%><br/>
提交方式：ＧＥＴ<br/>
您的ＩＰ已被记录，请自重！！！
<%elseif o=3 then%>
非法操作！<br/>
操作ＩＰ：<%=Request.ServerVariables("REMOTE_ADDR")%><br/>
操作时间：<%=Now%><br/>
提交方式：ＰＯＳＴ<br/>
你已超出错误次数,请离开！如果您是管理员,请联系程序作者:燃点真情,QQ531233814
<% Else%>
非法操作！<br/>
操作ＩＰ：<%=Request.ServerVariables("REMOTE_ADDR")%><br/>
操作时间：<%=Now%><br/>
您的ＩＰ已被封锁，请自重！！！
<% End if%><br/><anchor>返回上级<prev/></anchor></p></card></wml>

