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
<card id="card1" title="婴儿专科">
<p align="left">婴儿专科<br/>------------
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
       ssql="select fying,myjy,usesex,ml,tili from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn

if objgbrs("fying")=0 then
 response.write "<br/>你尚未结婚,何来宝宝呢?" 
   else
if objgbrs("myjy")<50 then
 response.write "<br/>你们还没有宝宝，赶快生一个吧。" 
 else
dim sex
if objgbrs("usesex")="0" then
sex="孩子由你的老婆带在身边，请叫你老婆带着孩子来检查。"
Response.write "<br/>" & sex 
   else
if objgbrs("ml")+objgbrs("tili")<300 then 
 response.write "<br/>由于你的体力和魅力少与300，不能给你们的宝宝最好的照顾，所以你们的宝宝感冒了，请去增加你的魅力和体力。" 
   else
if objgbrs("ml")+objgbrs("tili")<200 then 
 response.write "<br/>由于你的体力和魅力少与200，不能给你们的宝宝最好的照顾，所以你们的宝宝痢疾了，请去增加你的魅力和体力。" 
   else
if objgbrs("ml")+objgbrs("tili")>500 and objgbrs("ml")+objgbrs("tili")<800 then 
 response.write "<br/>宝宝身体一切正常。" 
   else
if objgbrs("ml")+objgbrs("tili")>800 then 
 response.write "<br/>宝宝身体很健康。" 
  end if  
   end if
   end if
end if  
   end if
   end if
   end if
Response.write "<br/>-------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>


