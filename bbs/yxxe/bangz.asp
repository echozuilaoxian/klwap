<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖帮助">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?num=num"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
关于“攻”<br/>
攻：即攻击.通过该按钮可以对怪物进行攻击；<br/>
关于“防”<br/>
防：即防守.通过该按钮可以对怪物进行防守；<br/>
关于“加”<br/>
加：即喝药.通过该按钮可以服用药水；<br/>
关于“逃”<br/>
逃：即逃跑.通过该按钮可以逃出战场,是否成功决于自己等级及血量；<br/>
关于“盾”<br/>
盾：即圣盾术.通过该按钮可以快速使用物品“圣盾术”；<br/>
关于“烈”<br/>
烈：即烈火术.通过该按钮可以快速使用物品“烈火术”；<br/>
关于“刺”<br/>
刺：即刺杀术.通过该按钮可以快速使用物品“刺杀术”；<br/>
关于“移”<br/>
移：即移动术.通过该按钮可以快速使用物品“移动术”；<br/>
<br/>
其它帮助排序中....<br/>
--------<br/>
<anchor><prev/>返回上级</anchor><br/>
</p>
</card>
</wml>