<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的江湖">
<p align="left">
<img src='logo1.gif' alt='热血江湖'/><br/>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="190"
lasttlls="190"
lasttls
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if
ids=Session("useid")
%>
<!--#INCLUDE file="conn.asp"-->

<!--#INCLUDE file="newid.asp"-->
<small>
<%
If time >= #21:00:00# and Time =< #23:00:00# Then
RefreshTime =time()
RefreshTimc =#23:00:00#
gg=DateDiff("s", RefreshTime, time())
mm=DateDiff("s", RefreshTimc, time())
response.Write "恶魔大门关闭剩余"&gg-mm&"秒<br/>"
end if
%>
-=个人道具=-<br/>
<a href='/BBS/yxxe/myzb.asp?SessionID=<%=SessionID%>'>我的装备</a>|
<a href='/BBS/yxxe/mysx.asp?SessionID=<%=SessionID%>'>我的属性</a><br/>
<a href='/BBS/yxxe/mywp.asp?SessionID=<%=SessionID%>'>我的物品</a>|
<a href='/BBS/yxxe/gg.asp?SessionID=<%=SessionID%>'>合成装备</a><br/>
-=<a href='/BBS/yxxe/cuan/cuan.asp?SessionID=<%=SessionID%>'>我的仓库</a>-=<br/>
-=江湖商店=-<br/>
<a href='/BBS/yxxe/tie.asp?SessionID=<%=SessionID%>'>购买装备</a>|
<a href='/BBS/yxxe/bang.asp?SessionID=<%=SessionID%>'>魔法小屋</a><br/>
<a href='/BBS/yxxe/yao.asp?SessionID=<%=SessionID%>'>江湖药店</a>|
<a href='/BBS/yxxe/dan.asp?SessionID=<%=SessionID%>'>江湖当铺</a><br/>
<a href='/BBS/yxxe/yz.asp?SessionID=<%=SessionID%>'>江湖银号</a>|
<a href='/BBS/yxxe/ke.asp?SessionID=<%=SessionID%>'>江湖客栈</a><br/>
-=技术交流=-<br/>
<a href='/BBS/xh6666/ContentlisT.asp?ForumID=27&amp;SessionID=<%=SessionID%>'>江湖论坛</a>|
<a href='/BBS/yxxe/tt.asp?SessionID=<%=SessionID%>'>对战江湖</a><br/>
<a href='/BBS/yxxe/ph.asp?SessionID=<%=SessionID%>'>江湖排行</a>|
<a href='/BBS/yxxe/zsm.asp?SessionID=<%=SessionID%>'>自行了断</a><br/>
<a href='/BBS/yxxe/tjbg.asp?SessionID=<%=SessionID%>'>报告错误</a>|
<%response.write "<a href='/bbs/reg/ckzxhyany6.asp?lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线玩家</a>"%>
<br/>-=寻宝地图=-<br/>
<a href='xl.asp?SessionID=<%=SessionID%>'>修罗古道</a>|
<a href='/BBS/yxxe/indax1.asp?pid=1&amp;SessionID=<%=SessionID%>'>恶魔广场</a><br/>
<a href='/BBS/yxxe/index1.asp?pid=2&amp;SessionID=<%=SessionID%>'>魔鬼山洞</a>|
<a href='/BBS/yxxe/index8.asp?pid=4&amp;SessionID=<%=SessionID%>'>蛮荒部落</a><br/>
-=练级地图=-<br/>
<a href='/BBS/yxxe/index1.asp?pid=1&amp;SessionID=<%=SessionID%>'>原始森林</a>|
<a href='/BBS/yxxe/index8.asp?pid=1&amp;SessionID=<%=SessionID%>'>毒蛇山谷</a><br/>
<a href='/BBS/yxxe/index1.asp?pid=4&amp;SessionID=<%=SessionID%>'>浩瀚北海</a>|
<a href='/BBS/yxxe/index8.asp?pid=2&amp;SessionID=<%=SessionID%>'>死亡棺材</a><br/>
<a href='/BBS/yxxe/index1.asp?pid=3&amp;SessionID=<%=SessionID%>'>丰富矿山</a>|
<a href='/BBS/yxxe/index8.asp?pid=3&amp;SessionID=<%=SessionID%>'>真云天空</a><br/>
-==========-<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>|
<a href="/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>
<a href='/BBS/yxxe/tjbg.asp?SessionID=<%=SessionID%>'>有建议意见请提出</a><br/>

<%
if Session("useid")="1" then 
Response.write "〓<a href='xh6666.asp?SessionID=" & SessionID & "'>管理员操作</a>〓<br/>"
End if
If time >= #21:00:00# and Time =< #23:00:00# Then
RefreshTime =time()
RefreshTimc =#23:00:00#
gg=DateDiff("s", RefreshTime, time())
mm=DateDiff("s", RefreshTimc, time())
response.Write "距离大门关闭剩余"&gg-mm&"秒<br/>"
end if
%>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/></small>
</p>
</card>
</wml>