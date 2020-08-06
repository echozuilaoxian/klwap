<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml> 
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="果园种子公司" >
<p>
<%
Response.write "种子公司/<a href='xtsd.asp?SessionID=" & SessionID & "'>系统商店</a>"
%>
<%
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & ""
End if
Response.write "<br/><img src='img/1.gif' alt=''/><a href='1.asp?SessionID=" & SessionID & "'>桃子</a>(400金币)<br/><img src='img/2.gif' alt=''/><a href='2.asp?SessionID=" & SessionID & "'>雪梨</a>(400金币)<br/><img src='img/3.gif' alt=''/><a href='3.asp?SessionID=" & SessionID & "'>樱桃</a>(400金币)<br/><img src='img/4.gif' alt=''/><a href='4.asp?SessionID=" & SessionID & "'>杨梅</a>(500金币)<br/><img src='img/5.gif' alt=''/><a href='5.asp?SessionID=" & SessionID & "'>芒果</a>(500金币)<br/><img src='img/6.gif' alt=''/><a href='6.asp?SessionID=" & SessionID & "'>草莓</a>(500金币)<br/><img src='img/7.gif' alt=''/><a href='7.asp?SessionID=" & SessionID & "'>香蕉</a>(600金币)<br/><img src='img/8.gif' alt=''/><a href='8.asp?SessionID=" & SessionID & "'>菠萝</a>(600金币)<br/><img src='img/9.gif' alt=''/><a href='9.asp?SessionID=" & SessionID & "'>西瓜</a>(600金币)<br/><img src='img/10.gif' alt=''/><a href='10.asp?SessionID=" & SessionID & "'>橙子</a>(800金币)<br/><img src='img/11.gif' alt=''/><a href='11.asp?SessionID=" & SessionID & "'>苹果</a>(800金币)<br/><img src='img/12.gif' alt=''/><a href='12.asp?SessionID=" & SessionID & "'>葡萄</a>(800金币)<br/>"
Response.write "<a href='/bbs/long/index.asp?SessionID=" & SessionID & "'>返回我的果园</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
%>
报时:<%=time%>
</p></card></wml>