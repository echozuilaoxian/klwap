﻿<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="社区餐厅">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
lasttlls="59"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>来到餐厅<br/>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?7=7"
End if
%>
您现在的金币有:<% =objgbrs("usejf") %><br/>
<img src="food01.gif" alt="load..."/><img src="food03.gif" alt="load..."/>
<br/><img src="food05.gif" alt="load..."/><img src="food06.gif" alt="load..."/>  
<br/>-=价格列表=-
<br/>鸡蛋:100金币
<br/>排骨:150金币
<br/>水鱼:172金币
<br/>汉宝:300金币
<br/>白粥:100金币
<br/>牛肉:250金币
<br/>羊肉:250金币
<br/>龙虾:500金币   
<br/>选择食品:
<select name="lx" value="rou">      
               <option value="rou">鸡蛋</option>       
                <option value="gt">排骨</option>       
                <option value="xnj">水鱼</option>      
                <option value="xz">汉堡</option>      
                <option value="lhr">白粥</option>      
                <option value="hzj">牛肉</option>      
                <option value="bhp">羊肉</option>     
                <option value="hss">龙虾</option>                      
              </select>      
<br/>选择数量: 
<select name="sl" value="1">      
                <option value="1">1</option> 
                <option value="5"> 5 </option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="25">25</option>
                <option value="30">30</option>
                <option value="35">35</option>
                <option value="40">40</option>
                <option value="50">50</option>
                <option value="100">100</option>
              </select>
<br/><anchor>用餐咯
<go method="post" href='movecl.asp?SessionID=<%=SessionID%>'>
<postfield name="lx" value="$(lx)"/>
<postfield name="sl" value="$(sl)"/>
</go>
</anchor>
<br/>-------------<br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
