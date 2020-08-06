<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/lt/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/lt/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/lt/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="宠物公司">
<p>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
lasttlls="100"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/lt/reg/useinfo.asp?id=" & iduse & "&amp;wap=" & wap & "'>" & converttowide(gfdsa) & "</a>来到宠物公司!"
if lycount>0 then
Response.write "<br/><a href='/lt/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a>"
End if
%>
<br/>您现在的金币有:<% =objgbrs("usejf")%>
<br/>价格列表 
--------
<br/>7.红头鸭3000金币 
<br/><img src="/lt/chan/cwt/cwya.gif" alt="红头鸭"/>

<br/>--------

<br/><a href='/lt/chan/cw.asp?wap=<%=wap%>'>宠物公司</a>
<br/><a href='/lt/public/gygl.asp?wap=<%=wap%>'>我的地盘</a>
<br/><a href='/lt/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>







