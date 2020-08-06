<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<%
SessionID=request.querystring("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
%><wml>
<card id="card1" title="创建帮派">
<p align="left">
创建帮派条件要求:
注册天数必须满15天以上；
申请成功后需要交纳5000金币的费用<br/>
帮派名(申请成功后不可以修改，8个字内)<br/>
<input type="text" name="name" maxlength="8"/>
<br/>帮派简介(20字内)：
<br/><input type="text" name="memo" maxlength="20"/>
<br/><anchor>提 交
<go method="post" href="/BBS/scttcl.asp?SessionID=<%=SessionID%>">
<postfield name="name" value="$(name)"/>
<postfield name="memo" value="$(memo)"/>
</go>
</anchor><br/>
--------
<% 
Response.write "<br/><a href='/BBS/area.asp?SessionID="&SessionID&"'>返回帮派中心</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID="&SessionID&"'>返回社区首页</a></p></card></wml>"
%>