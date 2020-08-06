<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<%
dim t,oo,id,SessionID
t=request.QueryString("t")
oo=request.querystring("oo")
id=request.QueryString("id")
SessionID=request.querystring("SessionID")
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="贴图帮助">
<p align='left'>
在聊天的内容中直接输入图片的名称,如:图=1,详细图片名称请看<br/>
编号36<img src='image/36.gif' alt='load...'/><br/>
编号37<img src='image/37.gif' alt='load...'/><br/>
编号38<img src='image/38.gif' alt='load...'/><br/>
编号39<img src='image/39.gif' alt='load...'/><br/>
编号40<img src='image/40.gif' alt='load...'/><br/>

<a href="t8.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>&amp;oo=<%=oo%>">下一页</a>|
<a href="t6.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>&amp;oo=<%=oo%>">上一页</a><br/>
<br/>--------<br/>
<%if oo="room" then%>
<a href="/bbs/room/talk.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>">返回发言</a><br/>
<a href="/bbs/room/room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>">返回聊室</a><br/>
<%elseif oo="rooms" then%>
<a href="talk.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>">返回发言</a><br/>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>">返回聊室</a><br/>
<%end if%>
<a href="index.asp?SessionID=<%=SessionID%>">聊室列表</a><br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-
<!--#include file="aa.asp"-->
</p>
</card>
</wml>