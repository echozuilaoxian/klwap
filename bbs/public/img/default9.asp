<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>                                                  
<card id="card1" title="表情列表">                                                    
<p>在回复里直接输入图片的数字加!!(小写),如"!00!",详细图片名称请看以下列表
<% wap=request.querystring("wap") %>
<br/><img src="46.gif" alt="load..."/>[46]
 <img src="47.gif" alt="load..."/>[47]
 <img src="48.gif" alt="load..."/>[48]
 <img src="49.gif" alt="load..."/>[49]
 <img src="50.gif" alt="load..."/>[50]
<br/><a href='default8.asp?wap=<%=wap%>'>上一页</a>
<%
response.write "<br/><a href='/bbs/public/ckly.asp?wap=" & wap & "'>回收件箱</a>"

Response.write"<br/><a href='/bbs/public/srxx.asp?wap=" & wap & "'>我的信箱</a>"


  
   Response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>地盘</a>-<a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>"%>
<br/>时间:<%=time%>
</p>
</card>
</wml>






