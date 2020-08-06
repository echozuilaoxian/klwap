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
<card id="main" title="宠物餐桌">
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
您现在的金币有:<% =objgbrs("usejf") %>
<br/>价格列表>>
<br/>鲤鱼35金币/条
<br/>增加生命:1点
<br/>增加热情:3点
<br/>选择食品:
<select name="lx" value="xnj">      
                <option value="xnj">鲤鱼</option>        
                                   
              </select>      
<br/>选择数量: 
<select name="sl" value="1">      
                <option value="1">1</option> 
                <option value="5"> 5 </option>
                <option value="10">10</option>
                <option value="15"> 15 </option>
                <option value="20"> 20 </option>
                <option value="25"> 25 </option>
                <option value="30"> 30</option>
                <option value="35"> 35 </option>
                <option value="40"> 40 </option>
                <option value="50"> 50 </option>
                <option value="100"> 100 </option>
              </select>
<br/><anchor>喂养>>
<go method="post" href='cwct.asp?SessionID=<%=SessionID%>'>
<postfield name="lx" value="$(lx)"/>
<postfield name="sl" value="$(sl)"/>
</go>
</anchor>
<br/>--------------<br/>
<a href='/bbs/chan/indexcw.asp?SessionID=<%=SessionID%>'>返回宠物餐厅</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>