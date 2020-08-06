<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="魔法卷轴屋">
<p>
<%
Server.ScriptTimeout=999
iipp=request("iipp")
if iipp="" then iipp="0"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?iipp="&iipp&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%if iipp=0 then%>
魔导师：这位少侠，买点魔法卷轴防身吧？
我们这里有<br/>
<img src='img/hcj.gif' alt='-wap-'/><br/>
回城卷[<a href='kk.asp?wid=5&amp;SessionID=<%=SessionID%>'>买</a>]<br/>
价格：100两/张<br/>
说明：使用本卷轴在任何地方都可以安全回城！<br/>
<img src='img/m1.gif' alt='-wap-'/><br/>
圣盾术[<a href='kk.asp?wid=1&amp;SessionID=<%=SessionID%>'>买</a>]<br/>
价格：100两/张<br/>
说明：使用本卷轴将制造出一个两回合免疫任何攻击的结界！<br/>
<img src='img/m2.gif' alt='-wap-'/><br/>
烈火术[<a href='kk.asp?wid=2&amp;SessionID=<%=SessionID%>'>买</a>]<br/>
价格：200两/张<br/>
说明：使用本卷轴将在三回合内使攻击力翻倍！<br/>
<img src='img/m3.gif' alt='-wap-'/><br/>
瞬移术[<a href='kk.asp?wid=3&amp;SessionID=<%=SessionID%>'>买</a>]<br/>
价格：500两/张<br/>
说明：使用本卷轴将使逃跑几率升为百分百！<br/>
<img src='img/m4.gif' alt='-wap-'/><br/>
刺杀术[<a href='kk.asp?wid=4&amp;SessionID=<%=SessionID%>'>买</a>]<br/>
价格：1000两/张<br/>
说明：使用本卷轴将在六回合内使攻击力翻倍！
<br/><a href='index.asp?SessionID=<%=SessionID%>'>江湖首页</a>
<%elseif iipp=1 then%>
==结界魔法卷轴==<br/>
使用本卷轴将
制造出一个两回合免疫任何攻击的结界！
<br/>结界
|<a href="bang.asp?iipp=2&amp;SessionID=<%=SessionID%>">闪电</a>
|<a href="bang.asp?iipp=3&amp;SessionID=<%=SessionID%>">逃跑</a>
|<a href="bang.asp?iipp=4&amp;SessionID=<%=SessionID%>">吸血</a><br/>
哈哈，八错八错，<br/>
<a href='kk.asp?wid=1&amp;SessionID=<%=SessionID%>'>偶就要结界魔法卷轴</a>
<%elseif iipp=2 then%>
==闪电魔法卷轴==<br/>
使用本卷轴将
在三会合内使攻击力翻倍！
<br/><a href="bang.asp?iipp=1&amp;wap=<%=wap%>">结界</a>
|闪电
|<a href="bang.asp?iipp=3&amp;wap=<%=wap%>">逃跑</a>
|<a href="bang.asp?iipp=4&amp;wap=<%=wap%>">吸血</a><br/>
哈哈，八错八错，<br/>
<a href='kk.asp?wid=2&amp;wap=<%=wap%>'>偶就要闪电魔法卷轴</a>

<%elseif iipp=3 then%>
==逃跑魔法卷轴==<br/>
使用本卷轴将
使逃跑几率升为百分百！
<br/><a href="bang.asp?iipp=1&amp;wap=<%=wap%>">结界</a>
|<a href="bang.asp?iipp=2&amp;wap=<%=wap%>">闪电</a>
|逃跑
|<a href="bang.asp?iipp=4&amp;wap=<%=wap%>">吸血</a><br/>
哈哈，八错八错，<br/>
<a href='kk.asp?wid=3&amp;wap=<%=wap%>'>偶就要逃跑魔法卷轴</a>
<%elseif iipp=4 then%>
==吸血魔法卷轴==<br/>
使用本卷轴将
随机抽取怪物的部分血液补充到本体中！
<br/><a href="bang.asp?iipp=1&amp;wap=<%=wap%>">结界</a>
|<a href="bang.asp?iipp=2&amp;wap=<%=wap%>">闪电</a>
|<a href="bang.asp?iipp=3&amp;wap=<%=wap%>">逃跑</a>
|吸血<br/>
哈哈，八错八错，
<br/><a href='kk.asp?wid=4&amp;wap=<%=wap%>'>偶就要吸血魔法卷轴</a>
<%end if%>
<br/>************
<!--#INCLUDE VIRTUAL="/bbs/yxxe/liao.asp"-->
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>

</p>
</card>
</wml>