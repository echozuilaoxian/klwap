<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="星座运势"> 
<p align="left">
<img src='logo.gif' alt='星座运势'/><br/>
<%SessionID=request.querystring("SessionID")%>
星座运势日日报<br/>
输入你的出生年份:
<br/>
<input title="key" name="key" value="19" format="*N" xml:lang="zh-CN"/>例:1980<br/>
星座:
<select title="startype" name="startype" >
<option title="水瓶座" value="1">水瓶座</option>
<option title="双鱼座" value="2">双鱼座</option>
<option title="白羊座" value="3">白羊座</option>
<option title="金牛座" value="4">金牛座</option>
<option title="双子座" value="5">双子座</option>
<option title="巨蟹座" value="6">巨蟹座</option>
<option title="狮子座" value="7">狮子座</option>
<option title="处女座" value="8">处女座</option>
<option title="天秤座" value="9">天秤座</option>
<option title="天蝎座" value="10">天蝎座</option>
<option title="射手座" value="11">射手座</option>
<option title="摩羯座" value="12">摩羯座</option>
</select><br/>
<anchor>查看运势
<go href="indexcl.asp?SessionID=<%=SessionID%>'>" method="post">
<postfield name="startype" value="$(startype)"/>
<postfield name="key" value="$(key)"/></go></anchor>
<br/>输入年份星座看看你今日的运程<br/> 
<a href='index.asp?SessionID=<%=SessionID%>'>星座运势</a><br/>
<a href='xin.asp?SessionID=<%=SessionID%>'>星座情缘</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>
