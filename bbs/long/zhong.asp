<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="我的果园种子"><p>
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
wapgywz="我的农场"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls



'--------------------
'宠物PK

'结束
'-------------------



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
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bd=&amp;"
End if
Response.write "<br/><img src='img/logo.gif' alt='花园'/><br/>"
if rs8("nong")="m" then
Response.write "<br/><a href='nong.asp?SessionID="&SessionID&"'>你的果园还没有认证</a><br/>"
else
%>

<%
end if
Response.write "你共有种子:<a href='zhong.asp?SessionID="&SessionID&"'>("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")粒</a>.<a href='zhong_m.asp?SessionID="&SessionID&"'>购买</a><br/>"
response.write "<br/><img src='img/1.gif' alt='.'/>桃子种子:"&rs8("hong")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='1'/><postfield name='name' value='hong'/></go></anchor>"
response.write "<br/><img src='img/2.gif' alt='.'/>雪梨种子:"&rs8("hmu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='2'/><postfield name='name' value='hmu'/></go></anchor>"
response.write "<br/><img src='img/3.gif' alt='.'/>樱桃种子:"&rs8("huang")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='3'/><postfield name='name' value='huang'/></go></anchor>"
response.write "<br/><img src='img/4.gif' alt='.'/>杨梅种子:"&rs8("kang")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='4'/><postfield name='name' value='kang'/></go></anchor>"
response.write "<br/><img src='img/5.gif' alt='.'/>芒果种子:"&rs8("man")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='5'/><postfield name='name' value='man'/></go></anchor>"
response.write "<br/><img src='img/6.gif' alt='.'/>草莓种子:"&rs8("zi")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='6'/><postfield name='name' value='zi'/></go></anchor>"
response.write "<br/><img src='img/7.gif' alt='.'/>香蕉种子:"&rs8("tian")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='7'/><postfield name='name' value='tian'/></go></anchor>"
response.write "<br/><img src='img/8.gif' alt='.'/>菠萝种子:"&rs8("zmu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='8'/><postfield name='name' value='zmu'/></go></anchor>"
response.write "<br/><img src='img/9.gif' alt='.'/>西瓜种子:"&rs8("yi")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='9'/><postfield name='name' value='yi'/></go></anchor>"
response.write "<br/><img src='img/10.gif' alt='.'/>橙子种子:"&rs8("qang")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='10'/><postfield name='name' value='qang'/></go></anchor>"
response.write "<br/><img src='img/11.gif' alt='.'/>苹果种子:"&rs8("qian")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='11'/><postfield name='name' value='qian'/></go></anchor>"
response.write "<br/><img src='img/12.gif' alt='.'/>葡萄种子:"&rs8("pu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='12'/><postfield name='name' value='pu'/></go></anchor>"
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


