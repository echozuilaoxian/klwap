<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<card id="main" title="&#x6539;&#x53D8;&#x5F62;&#x8C61;">
<p>
自定形象
<br/><input name="b"  maxlength="250" value="http://" />
<br/><a href="/bbs/skin/select.asp?id=$(b)&amp;SessionID=<%=SessionID%>">确定</a>
<br/>-------------
<br/>温馨提示：
<br/>自定形象就是输入绝对的图片地址。包含http://
<br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</card>
</wml>



