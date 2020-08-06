<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><wml>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<card id="card1" title="管理员列表">
<p align='left'>聊管列表
<br/>-----------<br/>
排名不分先后
<%
 Response.Write "<br/><a href='/bbs/public/fsly.asp?ids=2&amp;SessionID=" & SessionID & "'>少帅ID:2</a>"
%>


<br/>------------
<br/><anchor>返回上级<prev/></anchor>
<% 
Response.write "<br/><a href='/bbs/room/from.asp?SessionID=" & SessionID & "'>回聊室列表</a>"
 Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>地盘</a>"
%>-<a href='/bbs/ztlb.asp'>论坛</a>-<a href='/bbs/index.asp'>社区首页</a></p></card></wml>

