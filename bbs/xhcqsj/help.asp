<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid="&hotid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<card id="hotpk" title="唇枪舌剑-游戏简介"><p>
<img src='img/logo.gif' alt='..'/><br/>
游戏简介:<br/>
用“攻击”的方式来表达对好友的情感,要是你喜欢他(她),那就每天上来咬/抓/拍他(她)几次!<br/>
某个部位经常被好友攻击?那说明你的这个部位最受朋友喜欢.<br/>
规则:1.你只能进攻价格比你拥有金币低的部位,每进攻一次会让他(她)的部位价格上涨100,超过6小时没人进攻价格下跌100.遭到进攻时可以获得攻击价格一半的金币.<br/>
2.游戏中的角色分:吸血鬼/狼族/人族.不同角色进攻方式不同.让我们玩的更疯狂些吧.<br/>
3.人族被攻击一次活力-5,狼族-6,吸血鬼-7.活力为0则不能攻击其他玩家.人族攻击别人自己的活力+4,狼族+4,吸血鬼+5.<br/>
4.活力为零则不能攻击其他玩家,也不能被其他玩家攻击,需要自己或者由朋友唤醒.价格5000金币.否则要24小时后自行恢复.<br/>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


   