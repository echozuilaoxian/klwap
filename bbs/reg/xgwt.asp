<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="修改资料">  
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="327"
lasttls
id=request("id")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
mywt=objgbrs("mmwt")
%>
<%
if objgbrs("id")=Session("useid") then
%>
<%cw=request("cw")%>
<%if cw="1" then%>
原答案错误，请重新输入。<br/>
如忘记请联系管理员找回<br/>
<%end if%>
<%if cw="3" then%>
以下内容均不能为空！请重新输入！<br/>
<%end if%>
没有修改过.问题既是答案<br/>
原问题：<%=converttowidebaiti(mywt)%><br/>
原答案<input name="ymm<%=minute(now)%><%=second(now)%>" maxlength="500" value=""/><br/>
新问题<input name="xwt<%=minute(now)%><%=second(now)%>" maxlength="500" value=""/><br/>
新答案<input name="qda<%=minute(now)%><%=second(now)%>" maxlength="500" value=""/><br/>
<anchor title="确定修改">[提交修改]
<go href="xgwtcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset='utf-8'>
<postfield name="yda" value="$(ymm<%=minute(now)%><%=second(now)%>)"/>
<postfield name="xwt" value="$(xwt<%=minute(now)%><%=second(now)%>)"/>
<postfield name="xda" value="$(qda<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor>
<%else%>
<br/><img src="/guest/line.gif" alt="----------" />
<%end if%>
<br/><img src="/guest/line.gif" alt="----------" />
<%
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>[我的资料]</a>"
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" &SessionID & "'>[我的地盘]</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a><br/></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>



