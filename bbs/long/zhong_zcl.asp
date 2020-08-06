<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
wapgywz="我的果园"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls
kid=request("kid")
kd=request("kd")
if kd="" or kd>12 then
%>
<card id="hotpk" title="播种不成功" ontimer='index.asp?SessionID=<%=SessionID%>'><timer value='100'/><p>数据非法...正在返回果园<br/><a href='index.asp?SessionID=<%=SessionID%>'>返回我的果园</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
%>



<card id="hotpk" title="果园播种"><p>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from huakl where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd=&amp;"
End if
Response.write "<br/><img src='img/logo.gif' alt=''/><br/>"
if rs8("nong")="m" then
Response.write "<br/><a href='nong.asp?SessionID="&SessionID&"'>你的果园还没有认证</a><br/>"
Response.Write "</p></card></wml>"
response.end
end if
%>
<%
if kd=1 then name="hong"
if kd=2 then name="hmu"
if kd=3 then name="huang"
if kd=4 then name="kang"
if kd=5 then name="man"
if kd=6 then name="zi"
if kd=7 then name="tian"
if kd=8 then name="zmu"
if kd=9 then name="yi"
if kd=10 then name="qang"
if kd=11 then name="qian"
if kd=12 then name="pu"
if CStr(rs8(""&name&""))<1 then
%>
你还没有这类种子...<br/><a href='index.asp?SessionID=<%=SessionID%>'>返回我的果园</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
if rs8("hongz")>0 then
%>
你播种的瓜果还没有成熟,请收获后再来种...<br/><a href='index.asp?SessionID=<%=SessionID%>'>返回我的果园</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
response.write "播种成功……<br/>记得要帮它<a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>才会发芽的哦!"
sql="update huakl set huaf=huaf+1,hongz='"&kd&"',times=now(),"&name&"="&name&"-1   where CStr(ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
if kid<>0 then
sql="update usereg set usejf=usejf-100   where id=" &iduse & ""
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
end if
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


