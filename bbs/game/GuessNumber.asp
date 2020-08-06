<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" 

encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="猜数字游戏"><p>

<%
wap=request.querystring("wap")
      '设置页面不使用缓存
      Response.Expires = 0
%>
<%
dim GuessNum
on error resume next
GuessNum=Request("Number")
if GuessNum="" then GuessNum="0" End if
GuessNum=Clng(GuessNum)

Session("Count")=Session("Count") + 1
if Session("Count") < 10 and GuessNum <> session("Number") then

%>
<br/><input type='text' name='Number'  value='' format='*N'/>
<anchor>提交
<go href='guessNumber.asp?wap=<%=wap%>'>' method='post'>
<postfield name='Number' value='$(Number)'/>	
</go>
</anchor>
<%
end if
if GuessNum<0 or guessNum>100 then
    Response.write "请输入1~100之间的整数"
elseif GuessNum=0 then
	session("Count") = 0
    Randomize
	session("Number") = Int(rnd * 100 + 1)
    Response.write "请输入1~100之间的整数"
elseif GuessNum > session("Number") then
	response.write "你猜的太大了"
elseif GuessNum < session("Number") then
	response.write "你猜的太小了"
elseif GuessNum = session("Number") then
	response.write "祝贺你,猜对了"
end if

Response.write "<br/>共猜了" & Session("Count") & "次"
if Session("Count")=10 then
    Response.write "答案是" & Session("Number")
end if
%>
<a href="guessnumber.asp?Number=0">重新猜</a><br/>--------<br/>
<a href='/bbs/scyl.asp?wap=<%=wap%>'>返回社区娱乐</a><br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>返回社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>
