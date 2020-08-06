<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
Response.Write "<card id='card1' title='说明与帮助'><p>"
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
response.write "1.龙宝说明<br/>龙宝是社区推出的一项娱乐游戏,以股票的形式发行，在这里你可以买你自己喜欢的龙宝.所有龙宝均来自社区的所有设施,系统半小时左右会自动更新一次,有[升/降/平]之分.当该龙宝的价格为0时,该龙宝将会自动退出,所有持有该龙宝股份者也会被无条件的清空龙宝记录.所有的操作由系统自动执行.<br/>2.购买要求<br/>购买龙宝需要你在<a href='/bbs/reg/bank.asp?SessionID=" & SessionID & "'>社区银行</a>开户并有一定的存款,购买和卖出龙宝,系统都会收取0.2%的手续费(在银行帐户里扣).<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
</p></card></wml>


