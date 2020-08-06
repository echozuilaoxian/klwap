<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id='card1' title='群发消息'><p>
注：群发消息是发给所有注册会员<br/>
<%
ky=request("ky")

if ky="" then
%>
内容:<input type="text" name="content<%=minute(now)%><%=second(now)%>" value="" /><br/>
<anchor>确定发送<go method="post" href="qfxx.asp?ky=send&amp;adminmid=<%=request("adminmid")%>" accept-charset="UTF-8">
<postfield name="content" value="$(content<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<%
Elseif ky="send" then
content=replace(Request("content"),"'","")
content=replace(content,"<","")
content=replace(content,">","")

Set rs=Server.CreateObject("Adodb.RecordSet")
sql="Select * from usereg"
rs.Open sql,conn,1,3
for i=0 to rs.recordcount

ssql="insert into guestbook(ids,reids,niayo) values("&rs("id")&",0,'"&content&"')"
conn.execute(ssql)

rs.movenext
next

rs.close
set rs=nothing
conn.close
set conn=nothing
ErrMsg="群发信息成功！<br/>"
response.write ""&ErrMsg&""
response.write "<a href='qfxx.asp?adminmid="&request("adminmid")&"'>返回群发消息</a><br/>"
end if

response.write "<a href='wapAdmin_bbs.asp?adminmid="&request("adminmid")&"'>返回社区管理</a><br/>"
response.write "<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a><br/>"
%>
报时:<%=time%>
</p>
</card>
</wml>
