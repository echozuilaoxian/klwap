<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  dim id,memo,ForumID
ID=request("ID")
memo=request("memo")
 ForumID=request("ForumID")
  response.write "<card id='card1' title='追加礼金' ontimer='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id="&id&"&amp;SessionID=" & SessionID & "'><timer value='50'/><p align='left'>"
if ForumID="" or ForumID<0 or id<1 then
 Call Error("系统提示:非法数据")
end if
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=converttowidebaiti(objgbrsy("name"))
LX_yxxe=objgbrsy("qx")
end if
objgbrsy.close
Set objgbrsy= Nothing
if memo<>"" then
tjhm=Session("useid")
lj=clng(request("lj"))
if  lj="" or lj<1 then
 Call Error("系统提示:非法数据0")
end if
 set rs5=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id=" & tjhm & ""
rs5.open rspl,conn,1,2
usejf5=rs5("usejf")
 rs5.close
Set rs5= Nothing
If lj<0  or lj>usejf5 Then
 Call Error("系统提示:你没有这么多的钱呀")
end if
 sql="update usereg set usejf=usejf-" & lj & " where CStr(id)='" & tjhm & "'"
  conn.Execute(sql)
 sql="update  [wuza] set lj=lj+" & lj & " where CStr(id)='" &id & "'"
  conn.Execute(sql)

  response.write "系统扣除金币" & lj & "为发放的礼金,不能退还.<br/>成功追加礼金<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>按这里</a>返回" & dlname & "...."
else
%>
追加礼金<br/><input name="lj" maxlength="10" format="*N" size="20"/><br/>
<anchor>[提交]
<go method="post" href='/BBS/forum_content/BBsljzj.Asp?ForumID=<%=ForumID%>&amp;id=<%=ID%>&amp;SessionID=<%=SessionID%>&amp;memo=ok'>
<postfield name="lj" value="$(lj)"/></go></anchor>
<%
end if
  response.write "<br/><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
 %>
