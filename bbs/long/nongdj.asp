<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hoid=request("hoid")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=525
lasttls
%>
<card id="hotpk" title="果园等级说明"><p>
<img src='img/logo.gif' alt=''/><br/>
<%
response.write "<br/>果园等级以及对应分值:<br/>0-49分,等级:贫农<br/>50-199分,等级:果农<br/>200-499分,等级:园丁<br/>500-999分,等级:园长<br/>1000-1999分,等级:园主<br/>2000分以上,等级:庄主<br/>计算方式:<br/>访问量增加100加1分、社区魅力加5、<br/>留言增加100加1分、社区魅力加5<br/>播种一次加1分"
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


