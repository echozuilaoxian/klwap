﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="我的花园种子"><p>
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
wapgywz="我的花园"
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
       ssql="select * from hua where CStr(ids)='" & iduse & "'"
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
Response.write "<br/><img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>"
if rs8("nong")="m" then
Response.write "<br/><a href='/bbs/hua/nong.asp?SessionID="&SessionID&"'>你还没有购置农场</a><br/>"
else
%>

<%
end if
Response.write "你共有花种子:<a href='/bbs/hua/zhong.asp?SessionID="&SessionID&"'>("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")粒</a>.<a href='/bbs/hua/zhong_m.asp?SessionID="&SessionID&"'>购买</a><br/>"
response.write "<br/><img src='/bbs/xhjy/hua/1.gif' alt='.'/>红玫瑰种子:"&rs8("hong")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='1'/><postfield name='name' value='hong'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/2.gif' alt='.'/>红牡丹种子:"&rs8("hmu")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='2'/><postfield name='name' value='hmu'/></go></anchor>"
response.write "<br/><img src='/bbs/xhjy/hua/3.gif' alt='.'/>郁金香种子:"&rs8("huang")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='3'/><postfield name='name' value='huang'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/4.gif' alt='.'/>康乃馨种子:"&rs8("kang")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='4'/><postfield name='name' value='kang'/></go></anchor>"
response.write "<br/><img src='/bbs/xhjy/hua/5.gif' alt='.'/>满天星种子:"&rs8("man")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='5'/><postfield name='name' value='man'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/6.gif' alt='.'/>蓝玫瑰种子:"&rs8("zi")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='6'/><postfield name='name' value='zi'/></go></anchor>"
response.write "<br/><img src='/bbs/xhjy/hua/7.gif' alt='.'/>天堂鸟种子:"&rs8("tian")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='7'/><postfield name='name' value='tian'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/8.gif' alt='.'/>紫牡丹种子:"&rs8("zmu")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='8'/><postfield name='name' value='zmu'/></go></anchor>"
response.write "<br/><img src='/bbs/xhjy/hua/9.gif' alt='.'/>向日葵种子:"&rs8("yi")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='9'/><postfield name='name' value='yi'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/10.gif' alt='.'/>蔷薇花种子:"&rs8("qang")&"个|<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='10'/><postfield name='name' value='qang'/></go></anchor>"
response.write "<br/><img src='/bbs/xhjy/hua/11.gif' alt='.'/>牵牛花种子:"&rs8("qian")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='11'/><postfield name='name' value='qian'/></go></anchor>"
response.write "|<img src='/bbs/xhjy/hua/12.gif' alt='.'/>蒲公英种子:"&rs8("pu")&"个<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='12'/><postfield name='name' value='pu'/></go></anchor>"
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


