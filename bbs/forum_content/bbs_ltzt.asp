<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<%
SessionID=request.querystring("SessionID")
if  SessionID="" then  SessionID=Session("SessionID")
ForumID=request("ForumID")
if  ForumID="" then
 Call Error("<card id='card1' title='论坛专题'><p>系统提示:非法数据")
end if

set objgbrsyd=Server.CreateObject("ADODB.Recordset")
rspld="select * from sclt where id="&ForumID
objgbrsyd.open rspld,conn,1,2
if objgbrsyd.eof then
dlnames="无此论坛"
Else
dlnames=objgbrsyd("name")
end if
objgbrsyd.close
Set objgbrsyd= Nothing
page=Request("page")

%>
<card id="main" title="<%=ubb(dlnames)%>-专题" >
<p>
<%if Cstr(Session("yxxezb"))<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then%>
<a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">进入专题管理</a><br/>
<%end if
sql="select * from ltzt where ForumID="&ForumID&"  order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无专题记录"&bzbz&"<br/>"
else
%>
<%for i=1 to rs.RecordCount
j=j+1%>
<%=j%>:<a href="bbs_zt.asp?id=<%=rs("id")%>&amp;SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>"><%=ubb(rs("tjname"))%></a><br/>
<%
rs.movenext 
if rs.EOF then Exit for
 Next
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
Response.write "-----------<br/><a href='/BBS/forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" &ubb(dlnames) & "</a>"
%>
<br/>
<a href="/bbs/index.asp?SessionID=<%=request("SessionID")%>">返回社区</a><br/>
<br/>
</p>
</card>
</wml>