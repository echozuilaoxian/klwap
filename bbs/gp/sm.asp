<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="股票说明"><p>股票说明<br/>----------<br/>
<% 
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
Response.write "社区股票是采自现实股市的.<br/>[价格等都和现实的是一样的]，在这里属于模拟炒股，交易的是社区的虚拟货币.<br/>股票的价格起伏时时分分都有可能上涨或者下滑.<br/>在交易中，每次买进卖出系统都将收取[0.001的手续费]，交易货币在[银行账户]里操作，所以要炒股就必须先到<a href='/bbs/reg/bank.asp?SessionID="&SessionID&"'>社区银行</a>开户.<br/>炒股必须保证银行账户有足够的金币<br/>买入的股票会放在[我的股票]里面<br/>点击股票名可卖出<br/>"
%>
<!--#include file="bb.asp" -->
</p></card></wml>



