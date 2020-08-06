<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="<%=converttowidebaiti(SystemSiteName)%>-论坛版块">
<p align="left">
<%
wap=request.querystring("wap")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="81"
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/>------------<br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=1"
End if
Response.write "<a href='/BBS/Forum_ContenT/Top.Asp?ky=5&amp;SessionID="&SessionID&"'>&#x6700;&#x65B0;</a>&nbsp;|"
Response.write "&nbsp;<a href='/BBS/Forum_ContenT/Top.Asp?ky=4&amp;SessionID="&SessionID&"'>&#x70ED;&#x95E8;</a>&nbsp;|"
Response.write "&nbsp;<a href='/BBS/Forum_ContenT/Top.Asp?ky=1&amp;SessionID="&SessionID&"'>&#x7CBE;&#x534E;</a><br/>"
Response.write "<br/>"

%>
<%
response.write("-=&#x516C;&#x5171;&#x8BBA;&#x575B;=-<br/>")
 ycc="1"
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from sclt where yc<>1 and formid=0 and jiazu=0 order by pid asc"
rs.open sql,conn,1,2
if rs.eof then 
response.write("&#x6682;&#x65E0;&#x8BBA;&#x575B;&#x7248;&#x5757;")
   else
rs.Move(0)
dim j
j=1
do while ((not rs.EOF) and j <=30)
%>
<%if rs("lx")="1" then%>
<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=<%=rs("id")%>&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti(rs("name"))%></a>
<%elseif rs("lx")="2" then%>
<a href='<%=rs("shuo")%>'><%=rs("name")%></a>
<%elseif rs("lx")="0" then%>
<%=rs("name")%>
<%end if%>
<%if rs("brr")=1 then%><br/><%end if%>
<%
rs.MoveNext
j=j+1
loop
end if
rs.close
set rs=nothing


response.write ""&converttowidebaiti("-=帮派论坛=-")&"<br/>"
 ycc="1"
set rsv=Server.CreateObject("ADODB.Recordset")
sqlv="select top 8 * from sclt where yc<>1 and formid=0 and jiazu<>0 order by rc desc "
rsv.open sqlv,conn,1,1
if rsv.eof then
response.write("&#x6682;&#x65E0;&#x8BBA;&#x575B;&#x7248;&#x5757;")
   else
j=0
do while not rsv.eof
'if rsv("lx")="1" then
response.write "<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID="&rsv("id")&"&amp;SessionID="&SessionID&"'>"&rsv("name")&"</a>"
'elseif rsv("lx")="2" then
'response.write "<a href='"&rsv("shuo")&"'>"&rsv("name")&"</a>"
'elseif rsv("lx")="0" then
'response.write" "&rsv("name")&""
'end if
j = j + 1
if j mod 2=0 Then
Response.Write "<br/>"
Else
Response.Write "|"
End If
rsv.MoveNext
loop
end if
rsv.close
set rsv=nothing

%>

<%
Response.write "<a href='/BBS/area.asp?SessionID=" & SessionID & "'>&#x66F4;&#x591A;&#x5E2E;&#x6D3E;>></a><br/>"
Response.write "-------<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>"
Response.write "<a href='/BBS/public/gygl.asp?SessionID=" & SessionID & "'>[&#x6211;&#x7684;&#x5730;&#x76D8;]</a><br/>"
Response.write "<a href='/index.asp?SessionID=" & SessionID & "'>[&#x7F51;&#x7AD9;&#x9996;&#x9875;]</a>"
Response.write "<br/>&#x5317;&#x4EAC;&#x65F6;&#x95F4;" & Hour(Time) & ":" & Minute(Time)
%>
</p></card></wml>