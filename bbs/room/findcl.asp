<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="搜索聊室">
<p align='left'>
<% 
dim t,about,save
t=request("t")
about=Request("about")
save="%" & about & "%"

if t="1" then
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from room where roomname like '" & save & "' order by id"
  objgbrs.open ssql,myc,1,1

 elseif t="2" then
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   ssql="select * from room where cstr(idd)='" & about & "' order by id"
  objgbrs.open ssql,myc,1,1

End if

if objgbrs.eof then
   Response.write "对不起，没有搜索到您想找的聊天室...<br/>"
Else

name=objgbrs("roomname")
id=objgbrs("id")
Response.write "搜索结果:<br/>"

dim page
page=cint(request.QueryString("page"))
if page="" or page<1 then page=1
if page>objgbrs.pagecount then page=objgbrs.pagecount

For i=1 to pag
j=j+1
Response.write (page*pag-pag)+j & ".)<a href='rooms.asp?SessionID=" & SessionID & "&amp;id=" & objgbrs("idd") & "'>" & ubb(objgbrs("roomname")) & "</a><br/>"
    objgbrs.Movenext  
  if objgbrs.EOF then Exit for
    Next
end if
objgbrs.close
set objgbrs=nothing
%>
<br/>
<a href='find.asp?SessionID=<%=SessionID%>'>重新查找</a><br/>
--------<br/>
<a href="set.asp?SessionID=<%=SessionID%>">开设聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>