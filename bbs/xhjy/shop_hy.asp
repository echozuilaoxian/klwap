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
<card id="main" title="家园种子公司" >
<p>
=家园种子公司=
<%
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & ""
End if
Response.write "<br/><img src='/bbs/xhjy/hua/1.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50001&amp;SessionID=" & SessionID & "'>红玫瑰</a>(368金币)<br/><img src='/bbs/xhjy/hua/2.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50002&amp;SessionID=" & SessionID & "'>红牡丹</a>(300金币)<br/><img src='/bbs/xhjy/hua/3.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50003&amp;SessionID=" & SessionID & "'>郁金香</a>(300金币)<br/><img src='/bbs/xhjy/hua/4.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50004&amp;SessionID=" & SessionID & "'>康乃馨</a>(300金币)<br/><img src='/bbs/xhjy/hua/5.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50005&amp;SessionID=" & SessionID & "'>满天星</a>(300金币)<br/><img src='/bbs/xhjy/hua/6.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50006&amp;SessionID=" & SessionID & "'>蓝玫瑰</a>(368金币)<br/><img src='/bbs/xhjy/hua/7.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50007&amp;SessionID=" & SessionID & "'>天堂鸟</a>(300金币)<br/><img src='/bbs/xhjy/hua/8.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50008&amp;SessionID=" & SessionID & "'>紫牡丹</a>(300金币)<br/><img src='/bbs/xhjy/hua/9.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50009&amp;SessionID=" & SessionID & "'>向日葵</a>(300金币)<br/><img src='/bbs/xhjy/hua/10.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50010&amp;SessionID=" & SessionID & "'>蔷薇花</a>(300金币)<br/><img src='/bbs/xhjy/hua/11.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50011&amp;SessionID=" & SessionID & "'>牵牛花</a>(300金币)<br/><img src='/bbs/xhjy/hua/12.gif' alt=''/><a href='/bbs/xhjy/shop_wp.asp?shopid=1009&amp;fls=5&amp;did=50012&amp;SessionID=" & SessionID & "'>蒲公英</a>(300金币)<br/>"
Response.write "<a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
%>
报时:<%=time%>
</p></card></wml>