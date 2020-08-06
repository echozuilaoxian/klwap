<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid="&pid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")

%>

	<card id="login" title="修改江湖">
		<p>
<%if Session("Counter")="pass_numbers_55556666" then%>
		会员ＩＤ：<br/>
		<input name="id" maxlength="11" format="*N" size="20"/><br/>
		物品数量:<br/>
		<input name="n" maxlength="11" format="*N" size="20"/><br/>
                                      物品编号:<br/>
		<input name="kid" maxlength="11" format="*N" size="20"/><br/>
		<anchor>确定修改
		<go href="/bbs/yxxe/xh6666cl.asp?" method="post">
		<postfield name="n" value="$(n)" />
                                      <postfield name="id" value="$(id)" />
		<postfield name="kid" value="$(kid)" />
		</go>
		</anchor>
             
		<br/>------------<br/>

1.巨型号角<br/>
2.星光灭绝<br/>
3.魔皇粉星拳<br/>
4.情人花<br/>
5.积尸冥界波<br/>
6.天魔降伏<br/>
7.狮牙拳	<br/>	
8.江湖强力魔水<br/>
9.银子<br/>
10.宝石<br/>
11.庐山百龙霸<br/>
12.红色毒针<br/>
13.黄金箭<br/>
14.圣剑<br/>
15.钻石星尘<br/>
16.魔宫玫瑰<br/>
17.七彩石<br/>
18.珠宝粉<br/>
19.金刚石<br/>
20.铜矿<br/>
<a href="/bbs/yxxe/klwll.asp?SessionID=<%=SessionID%>">会员属性管理</a><br/>
<%End if%>
<a href="/bbs/yxxe/index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>
</p>
</card>
</wml>