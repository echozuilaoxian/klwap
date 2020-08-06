<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="宝宝资料">
<p align="left">
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
id=request("id")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn

if objgbrs("fying")=0 then
 response.write "<br/>该居民尚未结婚." 
   else
if objgbrs("myjy")=0 and  objgbrs("myjy")<50 then
Response.write "该居民尚未有孩子。"
   else
dim sex
if objgbrs("usesex")="0" then
sex="孩子由母亲带着"
Response.write "<br/>" & sex 
   else
if objgbrs("mybbxx")="'bb.gif'" then 
    sky="bb.gif"
  else
    sky=objgbrs("mybbxx")
end if
%>
<img src="<% =sky %>" alt="宝宝秀"/>
<%
Response.write "<br/>--------"
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & ""
End if
Response.write "<br/>名字：" & converttowidebaiti(objgbrs("myhz"))
  tjhm=objgbrs("fying")
  Response.write "<br/>父亲：<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("fying") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("fying") & "</a><br/>"
Response.write "母亲：<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename"))&"ID:" & objgbrs("id") & "</a>"
Response.write "<br/>年龄："

if objgbrs("myjy")>99 then
Response.write "1岁"
elseif objgbrs("myjy")>200 then
Response.write "2岁"
elseif objgbrs("myjy")>300 then
Response.write "3岁"
elseif objgbrs("myjy")>400 then
Response.write "4岁"
elseif objgbrs("myjy")>500 then
Response.write "5岁"
end if
if objgbrs("ml")+objgbrs("tili")>10000 then 
response.write "<br/>状态：强壮"
else
if objgbrs("ml")+objgbrs("tili")>5000 then 
response.write "<br/>状态：健康"
else
if objgbrs("ml")+objgbrs("tili")>3000 then 
response.write "<br/>状态：正常"
else
if objgbrs("ml")+objgbrs("tili")<2000 then 
response.write "<br/>状态：感冒"
else
if objgbrs("ml")+objgbrs("tili")<1000 then 
response.write "<br/>状态：痢疾"
end if
end if
end if
end if
end if
response.write "<br/>经验："& objgbrs("myjy")
response.write "点"
end if
end if
end if
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing


%>


