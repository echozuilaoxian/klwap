<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="商店">
<p align='left'>
<img src='shop.gif' alt=''/>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")="/hk/shop/index.asp?"
gfdsa=Session("ltname")
lasttlls="90"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>&#x6709;&#x65B0;&#x7559;&#x8A00;" & lycount & "&#x6761;</a><br/>"
    Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
End if
%>
<a href='#card2'>与小二对话</a><br/>
<b>¤货架上的卡片</b><br/>
<a href='shop_zj.asp?wap=<%=wap%>'>+|亲吻拥抱</a><br/>
<a href='shop_gx.asp?wap=<%=wap%>'>+|搞笑整人</a><br/>
<a href='shop_mg.asp?wap=<%=wap%>'>+|玫瑰花屋</a><br/>
<a href='shop_zq.asp?wap=<%=wap%>'>+|中秋祝福</a><br/>
<b>¤货架上的CD</b><br/>
<a href='shop_cd.asp?wap=<%=wap%>'>>真情祝福</a><br/>
<a href='shop_cd2.asp?wap=<%=wap%>'>>爱的表白</a><br/>
----------<br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>
</p>
</card>
<card id="card2" title="与小二对话">
<p>
小二说:嘻嘻，多亏站长的提拔我当上贺卡商店的老板喽！<br/>小店这里既有大量的卡片也有大量的CD，送给你的朋友做礼物是最合适的啦，当然也可以自用，请你看看需要什么吧。<br/>
<a href='/bbs/shop/index.asp?wap=<%=wap%>'>返回上级</a><br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a><br/>
</p>
</card><%
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
</wml>


