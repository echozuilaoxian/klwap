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
<card id="main" title="地盘中心">
<p align="center">
<img src='/bbs/Public/user_120.gif' alt='我的地盘'/><br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="335"
lasttls
gfdsa=Session("ltname")

if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?yxxe=1"
End if
Response.write " 您好:<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>"
%>

<%
dim w,m
set objgbrs=nothing
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from myfriend where Cstr(ids)=" & iduse & " and Left(friid,1)<>'*' order by friid"
objgbrs.open ssql,conn,1,3
if objgbrs.eof then
   w=0
   m=0
Else
   m=0
   w=CLng(objgbrs.RecordCount)
   For k=1 to objgbrs.PageSize
      tjhm=objgbrs("friid")
      if frionline="(在线)" then m=m+1
      objgbrs.Movenext
      if objgbrs.EOF then Exit for
   Next
End if
Response.write "<br/><a href='/bbs/sqbz/index.asp?SessionID=" & SessionID & "'>新人帮助</a>◆"
Response.write "<a href='/BBS/UseLogin.asp?SessionID=" & SessionID & "'>重新登陆</a><br/>"
Response.write "==个人状态==<br/>"
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>我的资料</a>◆"
Response.write "<a href='/bbs/reg/reedit.asp?SessionID=" & SessionID & "'>修改资料</a><br/>"
Response.write "<a href='/bbs/reg/reedsr.asp?SessionID=" & SessionID & "'>修改生日</a>◆"
Response.write "<a href='/bbs/skin/ccx.asp?SessionID=" & SessionID & "'>修改形象</a><br/>"
Response.write "<a href='/bbs/public/guanb.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>资料开关</a>◆" 
Response.write "<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>个性显示</a><br/>"
Response.write "==道具物品==<br/>"
Response.write "<a href='/BBS/Gift/MyItem.Asp?SessionID=" & SessionID & "'>我的物品</a>◆"
Response.write "<a href='/bbs/reg/useinfocw.asp?SessionID=" & SessionID & "'>我的宠物</a> <br/>"
Response.write "==我的财富==<br/>"
Response.write "<a href='/bbs/MyAccount.asp?SessionID=" & SessionID & "'>我的账户</a>◆"
Response.write "<a href='/bbs/room/dh/TransferCenter.asp?SessionID=" & SessionID & "'>积分兑换</a><br/>"
Response.write "==会员功能==<br/>"
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a>◆"
Response.write "<a href='/bbs/friandbook/mybookmark1.asp?SessionID=" & SessionID & "'>我的日记</a><br/>" 
Response.write "<a href='/bbs/myalbum/mybook.asp?SessionID=" & SessionID & "'>我的书包</a>◆"
Response.write "<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>我的信箱</a> <br/>"
Response.write "<a href='/BBS/forum_content/forum_myreceipt.Asp?id="& iduse &"&amp;SessionID=" & SessionID & "'>我的回贴</a>◆"
Response.write "<a href='/bbs/myalbum/myalbum1.asp?id="&iduse&"&amp;SessionID=" & SessionID & "'>我的相册</a><br/>"
Response.write "<a href='/bbs/forum_content/bbstdzt.asp?id="&iduse&"&amp;SessionID=" & SessionID & "'>我的帖子</a>◆" 
Response.write "<a href='/BBS/area.asp?SessionID=" & SessionID & "'>我的团体</a> <br/>"
Response.write "<a href='/bbs/friandbook/mybookmark.asp?SessionID=" & SessionID & "'>网址收藏</a>◆"
Response.write "<a href='/bbs/friandbook/mybookmarkyy.asp?SessionID=" & SessionID & "'>我的电话</a><br/>"
Response.write "<a href='/bbs/anther/gao.asp?SessionID=" & SessionID & "'>领取日薪</a>◆" 
Response.write "<a href='/bbs/Reg/Bank.asp?SessionID=" & SessionID & "'>社区银行</a><br/>"

Response.write "-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
Response.write "<a href='/index.asp?SessionID=" & SessionID & "'>返回网站首页</a>"
%>
<br/>北京时间:<%=time%>
<%
Response.write "<br/></p></card></wml>" 
conn.close
set objgbrs=nothing
set objgbrs2=nothing
set conn=nothing
Function frionline()
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
   objgbrr.open ssql,conn
   if not objgbrr.eof then
      frionline="(在线)"
   End if
   set objgbrr=nothing
End function
%>