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
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("bbslybz")=""
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="7"
lasttlls="7"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
     set zmyars=Server.CreateObject("ADODB.Recordset")
  zmyasql="select * from ltsy"
zmyars.open zmyasql,conn
%>
恭喜您已经成为社区的广告经纪人!<br/>
您的业务统计<br/>您累积获得业务佣金：<% =objgbrs("rcj") %>金币<br/>
 您的广告代码：<br/><a href='<%=zmyars("url")%>/bbs/a.asp?id=<%=session("useid")%>&amp;SessionID=<%=SessionID%>'><%=zmyars("url")%>/bbs/a.asp?id=<%=session("useid")%></a><br/>
您可以将这段广告代码贴到其他论坛或个人主页等地方，别人通过这个链接进入社区，您就能自动获得业务反馈和业务佣金。<br/>
为防止作弊，广告公司启用了防刷新机制，同一IP地址不能连续数次打开。<br/>
 <br/>宣传攻略<br/>
通过QQ把你的广告代码发给你的好友,让他们用这个地址访问社区.<br/>
在网上的各大论坛里,用你的广告代码作为签名,不要灌水哦!<br/>
通过E-mail把你的广告代码发给你的朋友,让他们用这个地址访问<%=zmyars("url")%>社区.
<br/>--------<br/><anchor><prev/>返回上层</anchor><br/>
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