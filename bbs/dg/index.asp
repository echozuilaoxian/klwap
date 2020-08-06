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
<card id="card" title="打工挣币">
<p>打工赚币.多劳多得.但要注意身体哦!
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<br/>      
<select title="选择类型" name='lx'>
<option title="种田" value="rou">种田</option>      
<option title="医生" value="gt">医生</option>      
<option title="教师" value="xnj">教师</option>   
<option title="搬运" value="rou">搬运</option>     
</select>
<br/> <anchor>开始打工
<go method="post" href='dgcl.asp?SessionID=<%=SessionID%>'>
<postfield name="lx" value="$(lx)"/>
<postfield name="sl" value="1"/>
</go>
</anchor><br/>还是做临工吧<br/>
<a href='gz.asp?SessionID=<%=SessionID%>'>家园临工</a><br/>
<br/>----------<br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>