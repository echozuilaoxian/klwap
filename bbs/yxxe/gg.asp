<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="合成装备">
<p>
<%
Server.ScriptTimeout=999
pid=request("pid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
现已开放合成以下物品.
<br/>
<img src='w/9.gif' alt='神魔玄兵'/><br/>
<img src='t/9.gif' alt='神魔玄盔'/><br/>
<img src='y/9.gif' alt='神魔玄翼'/><br/>
<img src='x/9.gif' alt='神魔玄靴'/><br/>
<a href="zbhc.asp?SessionID=<%=SessionID%>">[详细....]</a><br/>
所需合成材料比较多.但这装备只能经过合成这途径获取...给点耐心收集材料吧<br/>

<br/>另外 新增地图"恶魔广场" 一天只开放2两个小时进入,开门时间是每晚21:00-23:00<br/>里面打怪所获经验是外面的5倍..不过只有两个小时哦..
<br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>