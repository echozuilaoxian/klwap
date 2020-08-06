<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="芒果种子店"><p>
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



'--------------------
'宠物PK

'结束
'-------------------

set rs9=Server.CreateObject("ADODB.Recordset")
       ssql="select * from longdate where CStr(id)='5'"
       rs9.open ssql,conn,1,1

  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在<br/>"
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
Response.write "<img src='img/logo.gif' alt=''/><br/>"
if rs8("nong")="m" then
Response.write "<br/><a href='nong.asp?SessionID="&SessionID&"'>你的果园还没有认证</a><br/>"
else
%>

<%
end if
Response.write "你共有种子:<a href='zhong.asp?SessionID="&SessionID&"'>("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")</a>"
response.write "<br/>"&rs9("name")&"：<img src='img/5.gif' alt=''/><br/>剩余数量:"&rs9("so")&"个<br/>价格:"&rs9("jia")&"金币<br/>成熟用时:6小时"
%>
<br/><anchor title="确定">确定要购买
<go method="post" href='zhong_mcl.asp?SessionID=<%=SessionID%>'>
<postfield name="kd" value="<%=rs9("id")%>"/>
<postfield name="sl" value="$(sl)"/>
</go>
</anchor>
<%
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
rs9.close
Set rs9= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


