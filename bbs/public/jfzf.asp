<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="奖罚金币/经验">
<p>
<%
SessionID=request.querystring("SessionID")
dim id
id=request("id")
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "没有该用户<br/>"
else
Response.write "奖罚会员:" & converttowidebaiti(objgbrs("usename"))&"<br/>"
%>
奖励或处罚金币/经验：
<br/><select name="jorf" value="j">
<option value="j">&#22870;&#21169;</option>
<option value="f">&#25187;&#38500;</option>
</select>
<%
   Response.write "<br/><input type='text' name='munber' format='*N' value='5'/><br/>奖罚理由:<br/><input type='text' name='zfly'/>"
   Response.write "<br/><anchor>==奖罚金币==<go method='post' href='/bbs/public/jfzfcl.asp?SessionID=" & SessionID & "'><postfield name='jorf' value='$(jorf)'/><postfield name='munber' value='$(munber)'/><postfield name='id' value='" & id & "'/><postfield name='zfly' value='$(zfly)'/></go></anchor>"
   Response.write "<br/><anchor>==奖罚经验==<go method='post' href='/bbs/public/jfzfcl2.asp?SessionID=" & SessionID & "'><postfield name='jorf' value='$(jorf)'/><postfield name='munber' value='$(munber)'/><postfield name='id' value='" & id & "'/><postfield name='zfly' value='$(zfly)'/></go></anchor>"
End if
End if
%>
<br/><b>注意：奖罚经验的结果是你所填数字×5倍，任何操作都是有记录的，请谨慎操作！</b><br/>--------------
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
