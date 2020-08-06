<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="封禁操作">
<%
SessionID=request.querystring("SessionID")
dim id
id=request("id")
%>
<p>
<%
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "没有该用户<br/>"
else
Response.write "封禁会员:" & converttowidebaiti(objgbrs("usename"))&"<br/>"
end if
if objgbrs("yxxezb")<>0 and Session("Counter")="" then
Response.write "越权操作啦!!!"
else
%>
封禁权限:<select name="bzfscz" value="1">
<option value="1">发表&#26435;</option>
<option value="2">&#36827;&#20837;&#26435;</option>
</select>
<br/>
处罚金币:<input type='text' name='munber' format='*N' value='5'/><br/>
处罚理由:<input type='text' name='zfly'/>
<br/><anchor>[-提交-]<go method="post" href='/bbs/public/jyczcl.asp?SessionID=<%=SessionID%>'>
<postfield name="bzfscz" value="$(bzfscz)"/>
<postfield name='jorf' value='j'/>
<postfield name='munber' value='$(munber)'/>
<%Response.write "<postfield name='id' value='" & id & "'/>"%>
<postfield name='zfly' value='$(zfly)'/>
</go></anchor>
<%end if%>
<%end if%>
<br/>--------------
<br/><a href='/bbs/reg/useinfo.asp?id=<%=ID%>&amp;SessionID=<%=SessionID%>'>返回会员资料</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>
<%
conn.close
Set objgbrs= Nothing
set conn=nothing
%>



