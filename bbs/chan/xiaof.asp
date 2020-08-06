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
<card id="main" title="消费场所">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
lasttlls="100"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>来此消费"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?6=8"
End if
%>
<br/>-----------
<br/><a href='/bbs/chan/indexcw.asp?SessionID=<%=SessionID%>'>+|喂养宠物</a>
<%
'Response.write "<br/><a href='/bbs/chan/ygxy.asp?SessionID=" & SessionID & "'>+|高级桑拿</a>"
'Response.write "<br/><a href='/bbs/chan/jb.asp?SessionID=" & SessionID & "'>+|霸王酒吧</a> "
%>
<br/><a href='/bbs/chan/cwxy.asp?SessionID=<%=SessionID%>'>+|宠物浴室</a>
<br/><a href='/bbs/chan/index.asp?SessionID=<%=SessionID%>'>+|城市餐厅</a>
<br/><a href='/bbs/chan/mr.asp?SessionID=<%=SessionID%>'>+|利利美容</a>
<br/>-----------
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>







