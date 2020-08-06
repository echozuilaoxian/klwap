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
<card id="main" title="社区桑拿">
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
gfdsa=Session("ltname")
lasttlls="58"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>光临桑拿场<br/>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?9=8"
End if
%>
您现在的金币有:<% =objgbrs("usejf") %>
<br/>价格列表 
<br/>1.普通洗澡20金币一次 
<br/>2.游泳式澡40金币一次 
<br/>3.桑拿150金币一次 
<br/>4.搓背服务170金币一次 
<br/>5.按摩服务200金币一次       
<br/>请选择洗澡类型:
<select name="lx" value="rou">      
               <option value="rou">普通洗澡</option>       
                <option value="gt">游泳式澡</option>       
                <option value="xnj">桑拿</option>           
                <option value="lhr">搓背服务</option>      
                <option value="hzj">按摩服务</option>                           
              </select>      
<br/>请选择洗澡次数: 
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
<br/><anchor>开始咯>>
<go method="post" href='movecl33.asp?SessionID=<%=SessionID%>'>
<postfield name="lx" value="$(lx)"/>
<postfield name="sl" value="$(sl)"/>
</go>
</anchor>
<br/>----------<br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>

