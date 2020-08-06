<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="广告公司"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="600"
lasttlls="600"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
您好!欢迎您来到社区广告公司!<br/>
 您希望靠自己的劳动赚很多金币吗？<br/>
 方法就是做：广告经纪人<br/>您可以通过宣传我们这个社区从而挣得金币。<br/>
  您只需将我们提供给您的代码放到你的WAP网上，别人通过您的代码进入本站社区，您就可以获得金币。<br/>
  您可根据宣传量获得金币，交换比例为：1个注册会员1000金币奖励，系统自动增加到您的帐户<br/>
  <a href='advo.asp?SessionID=<%=SessionID%>'>进入获取代码</a><br/>---------<br/>
 <a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
<br/><%=now%>
</p>
</card>
</wml>
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>