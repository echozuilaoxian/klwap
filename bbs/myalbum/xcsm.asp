<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card id="main" title="相册说明">
<p align="left">相册说明<br/>--------<br/>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")%>
社区的注册会员都拥有以下权力<br/>
1.请先用手机<a href="/bbs/wapcs/wap2.asp?SessionID=<%=SessionID%>">上传</a>你的相片.手机必须支持WAP2.0。<br/>
 .上传成功后收藏至<a href="/bbs/myalbum/mybook.asp?SessionID=<%=SessionID%>">我的书包</a>(多重功能).<br/>
 .点击你上传的相片>点击设为相册即可.<br/>
2.还可以用图片URL<a href="/bbs/myalbum/tjtp.asp?SessionID=<%=SessionID%>">添加</a>图片到你的书包。<br/>
<br/>
--------
<br/><a href="/bbs/myalbum/index.asp?SessionID=<%=SessionID%>">返回网友相册</a>
<br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</card>
</wml>


