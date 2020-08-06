<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>
<card id='card1' title="汽车买卖">

<p>
<% wap=request.querystring("wap") %>
卖出汽车扣除30%的折旧费，你确定要卖出吗?<br/>
<anchor>卖出<go method="post" href='mtc.asp?wap=<%=wap%>'><postfield name="cz" value="0"/></go></anchor>
 <a href='/bbs/index.asp?wap=<%=wap%>'>不卖了</a><%
response.write "<br/><br/><a href='/bbs/chan/cz.asp?wap=" & wap & "'>汽车公司</a><br/><a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"%>


