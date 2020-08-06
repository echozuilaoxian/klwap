<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="封禁操作"><p>
<%
SessionID=request.querystring("SessionID")
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")<>"" or Session("Counter")="pass_numbers_55556666" then
%>
输入ID:<br/><input type='text' name='id' format='*N' value='15'/>
<br/>封禁他(她)的:
<br/><select name="bzfscz" value="1">
<option value="1">发表权</option>
</select>
<br/>处罚金币:
<br/><input type='text' name='munber' format='*N' value='5'/>
<br/>封禁理由:<br/><input type='text' name='zfly'/>
<br/><anchor>提 交<go method="post" href='/BBS/public/jyczcl.asp?SessionID=<%=SessionID%>'>
<postfield name="bzfscz" value="$(bzfscz)"/>
<postfield name='jorf' value='j'/>
<postfield name='munber' value='$(munber)'/>
<postfield name='id' value='$(id)'/>
<postfield name='zfly' value='$(zfly)'/>
</go></anchor>
<%end if%>
<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%><br/>
<anchor>返回上级<prev/></anchor><br/>
<a href="/BBS/Index.Asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p></card></wml>


