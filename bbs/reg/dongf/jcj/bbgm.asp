<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select myjy,myhz,usesex,fying from usereg where CStr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
response.write "<card id='card1' title='修改BB记录'><p>修改BB记录<br/>--------------"
dim sex
if objgbrs("usesex")="0" then
sex="孩子由你的老婆带在身边，请叫你老婆带着孩子来更改资料。"
Response.write "<br/>" & sex 
   else
if objgbrs("myjy")<51 then
response.write "<br/>你还没有孩子，请不要在警察局捣乱！" 
   else

if objgbrs("fying")=0 then
 response.write "<br/>你尚未结婚,何来宝宝呢?" 
   else
%>
<br/><a href='/bbs/reg/dongf/bb.asp?SessionID=<%=SessionID%>'>孩子形象列表</a>
<br/>孩子形象:<select name="touxx" value="bb.gif">
<option value="bb.gif">默认</option>
<option value="bb1.gif">形象1</option>
<option value="bb2.gif">形象2</option>
<option value="bb3.gif">形象3</option>
<option value="bb4.gif">形象4</option>
<option value="bb5.gif">形象5</option>
<option value="bb6.gif">形象6</option>
<option value="bb7.gif">形象7</option>
<option value="bb8.gif">形象8</option>
</select><br/>
孩子新名:<input type="text" name="myhz<%=minute(now)%><%=second(now)%>" maxlength="10" size="8" value="<%=objgbrs("myhz")%>" /><br/>
<anchor>确认
<go method="post" href="/bbs/reg/dongf/jcj/bbcscl.asp?SessionID=<%=SessionID%>">
<postfield name="touxx" value="$(touxx)"/>
<postfield name="myhz" value="$(myhz<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor>
<%
end if
end if
end if
Response.write "<br/>--------------<br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>注：修改资料收取10000金币手续费</p></card></wml>"
objgbrs.close
conn.close
set objgbrs=nothing
set conn=nothing
%>