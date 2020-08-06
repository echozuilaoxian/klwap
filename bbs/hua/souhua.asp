<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="收到的鲜花"><p>
<img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>
<%
  if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>

<%

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
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
if rs8("nong")="m" then
Response.write "<a href='/bbs/hua/nong.asp?SessionID="&SessionID&"'>你还没有购置农场</a><br/>"
else
%>

<%
end if
Response.write "<br/>你共收到鲜花:("&rs8("hongss")+rs8("huangss")+rs8("ziss")+rs8("yiss")+rs8("hmuss")+rs8("kangss")+rs8("manss")+rs8("tianss")+rs8("zmuss")+rs8("qangss")+rs8("qianss")+rs8("puss")&")朵<br/>"
response.write "<br/><img src='/bbs/xhjy/hua/1.gif' alt='.'/>红玫瑰:"&rs8("hongss")&"朵."
response.write "<img src='/bbs/xhjy/hua/2.gif' alt='.'/>红牡丹:"&rs8("hmuss")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/3.gif' alt='.'/>郁金香:"&rs8("huangss")&"朵."
response.write "<img src='/bbs/xhjy/hua/4.gif' alt='.'/>康乃馨:"&rs8("kangss")&"朵<br/><img src='/bbs/xhjy/hua/5.gif' alt='.'/>满天星:"&rs8("manss")&"朵."
response.write "<img src='/bbs/xhjy/hua/6.gif' alt='.'/>蓝玫瑰:"&rs8("ziss")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/7.gif' alt='.'/>天堂鸟:"&rs8("tianss")&"朵."
response.write "<img src='/bbs/xhjy/hua/8.gif' alt='.'/>紫牡丹:"&rs8("zmuss")&"朵<br/><img src='/bbs/xhjy/hua/9.gif' alt='.'/>向日葵:"&rs8("yiss")&"朵."
response.write "<img src='/bbs/xhjy/hua/10.gif' alt='.'/>蔷薇花:"&rs8("qangss")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/11.gif' alt='.'/>牵牛花:"&rs8("qianss")&"朵."
response.write "<img src='/bbs/xhjy/hua/12.gif' alt='.'/>蒲公英:"&rs8("puss")&"朵"
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


   


