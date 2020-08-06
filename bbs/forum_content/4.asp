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
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
gfdsa=Session("ltname")
ForumID=request("ForumID")
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

    Response.write "<card id='card1' title='"&dlname&"-操作记录'><p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
End if 
if Cstr(Session("bzbz"))=ForumID or Session("Counter")="pass_numbers_55556666" then
%>
注:论坛基金用于活动奖励用户,滥用基金奖励功能者,经管理员查证后将撤消其版主权<br/>
输入金额:<input type="text" name="zbs" value="10" format="*N" maxlength="8" size="8"/>
<br/>输入ＩＤ:<input type="text" name="id" format="*N" maxlength="15" size="8"/>
<br/>选择用途:<select name="jjyt" value="奖励用户">
<option value="奖励用户">奖励用户</option>
<option value="活动奖励">活动奖励</option>
</select>
<br/><anchor>[-提交-]
<go method="post" href="44.asp?SessionID=<%=SessionID%>">
<postfield name="zbs" value="$(zbs)"/>
<postfield name="id" value="$(id)"/>
<postfield name="jjyt" value="$(jjyt)"/>
<postfield name="gfdsa" value="<%=gfdsa%>"/>
<postfield name="ForumID" value="<%=ForumID%>"/>
</go></anchor>
<%
Response.write "<br/>----------<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
%>