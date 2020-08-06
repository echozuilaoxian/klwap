<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<%
sq1="select * from upset order by id"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rs1.close
Set rs1=nothing
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
IDs=request("IDs")
yxxeID=request("yxxeID")
page=request("page")
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="Wap2.0上传附件">
<p>
<%If request("id")="" Then response.redirect"/bbs/index.asp"%>
<%if request("id")=1 then %>
   文件名不能为空！<br/>
<%End if%>
<%if request("id")=2 then %>
文件类型错误，上传不成功！<br/>
允许上传的文件类型有:<%=rsallowedfile%><br/>
<%End if%>
<%if request("id")=3 then %>
文件过大，上传不成功！<br/>
允许上传的文件大小为:<%=rsfilesize%>KB<br/>
<%End if%>
<%if request("id")=4 then %>
<%
size=CStr(request("size"))
sq2="select * from data where filesize='"&size&"'"
Set Rs2 = Server.CreateObject("Adodb.Recordset")
rs2.open sq2,conn,1,2
ids=rs2("id")
title=rs2("title")
explain=rs2("explain")
size=rs2("filesize")
addtime=rs2("addtime")
url=rs2("dataname")
%>
<%
filetype=rs2("dataname")
i=InStrRev(filetype,".")
l=Len(filetype)
If i>0 Then
  filetype=Right(filetype,l-i)
End If%>
文件已经上传.请不要重复上传<br/>-----------<br/>
文件格式:<%=filetype%><br/>
<%size=Round(rs2("filesize")/1024,2)
If Left(size,1)="." Then size="0"&size%>
文件大小:<%=size%>KB<br/>
文件地址:<%=url%><br/>
<%
jpg="jpg"
gif="gif"
png="png"
bmp="bmp"
jpeg="jpeg"
mp3="mp3"
if filetype<>jpg and filetype<>gif and filetype<>jpeg and filetype<>bmp and filetype<>png and filetype<>mp3 then
ky="r"
wjss="(url=/bbs/wapcs/pic/"&rs2("dataname")&")免费下载(/url)\"
else
ky="k"
wjss="(img)/bbs/wapcs/pic/"&rs2("dataname")&"(/img)"
end if
%>
帖子标题
<br/><input type="text" name="title<%=minute(now)%><%=second(now)%>" value="<% =rs2("title") %>" maxlength="25"/>
<br/>帖子内容
<br/><input type="text" name="explain<%=minute(now)%><%=second(now)%>" value="<% =rs2("explain")%>"/>
<br/><anchor>[提交]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?ForumID=<%=ForumID %>&amp;SessionID=<%=SessionID%>'>
<postfield name="name" value="$(title<%=minute(now)%><%=second(now)%>)"/>
<postfield name="memo" value="<%=wjss%>[格式:<%=filetype%>,大小:<%=size%>KB]\$(explain<%=minute(now)%><%=second(now)%>)"/>
<postfield name='pic' value='<%=ky%>'/>
<postfield name='lzdname' value='d'/>
</go></anchor><br/>
<%rs2.close
Set rs2=nothing%>
<%End if%>
<%if request("id")=5 then %>
   请选择要上传的文件！<br/>
<%End if%>
<%if request("id")=6 then %>
系统错误，请联系管理员！<br/>
错误6，保存上传数据所需文件夹不存在！<br/>
<%End if
%>
-----------<br/>
<%
youmdb="/admin/Database/#qqccb.mdb" '您社区数据库地址
set conn=Createobject("ADODB.Connection")
conn.ConnectionString="DBQ="& server.mappath(youmdb)& ";DRIVER={Microsoft Access Driver (*.mdb)};"
conn.open
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
if yxxeid<>"" and ids<>"" then
%>
<a href='/bbs/wapcs/tjwzimgjz.asp?ForumID=<%=ForumID%>&amp;ID=<%=IDs%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回续传附件</a><br/>
<a href='/BBS/Forum_Content/BBS_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=IDs%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回查看帖子</a><br/>
<%Else%>
<a href='/bbs/wapcs/tjwzimg.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>'>返回续传附件</a><br/>
<%end if%>
<a href='/bbs/forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>'>返回<%=dlname %></a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</card>
</wml>
