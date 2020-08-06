<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="贴图帮助">
<p>
<%SessionID=request.querystring("SessionID")%>
在聊天的内容中直接输入图片的名称,如"!01!",详细图片名称请看表情列表。
<br/><a href='img/default.asp?SessionID=<%=SessionID%>'>>表情列表</a>
<br/><a href='/bbs/tz/chatroom/talk.asp?SessionID=<%=SessionID%>'>>返回上一级</a>
</p>
</card>
</wml>



