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
SessionID=request.querystring("SessionID")
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<card id='card1' title='编辑文章'><p>您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
lasttlls="149"
lasttls
dim ForumID,id,page,i
i=request("i")
id=request("id")
page=request("page")
ForumID=request("ForumID")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<card id='card1' title='编辑文章'><p>ID错误</p></card></wml>"
      objgbrs.close
      set objgbrs=nothing
      response.end
  end if
iduse=Session("useid")
  if CStr(objgbrs("tjhm"))<>CStr(Session("useid")) then
      response.write "<card id='card1' title='越权操作'><p>越权操作！</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
response.write "<card id='card1' title='编辑帖子-"&converttowidebaiti(objgbrs("biaoti"))&"'>"


Dim fso
Dim f
    set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
    aaacc=f.ReadAll
    loop
    f.close
    set f=nothing
    set fso=nothing

showwz=CLng(Session("showwz"))
Content=aaacc
moy=request("moy")
if moy="123" then
pageWordNum=10000
else
pageWordNum=showwz
End IF

StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
Spage=request("Spage")
if isnull(Spage) or Spage="" then
Spage=0
else
Spage=request("Spage")-1
end if
Content = mid(Content,StartWord+Spage*PageWordNum,PageWordNum)
%>
<onevent type="onenterforward">
<refresh>
<setvar name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>"/>
<setvar name="memo" value="<% =converttowidebaiti(Content) %>"/>
</refresh>
</onevent>
<p align="left">
<%
if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
Session("returnuppath")=""
End if
%>
编辑帖子:<% =converttowidebaiti(objgbrs("biaoti")) %><br/>
编辑第<b><% =Spage+1%></b>页/页<b><%=pageWordNum%></b>字/分<b><%=PageAll%></b>页/共<b><%=Length%></b>字<br/>
文章标题:<input type="text" name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>" maxlength="25"/><br/>
文章内容:<input type="text" name="memo" value="<% =converttowidebaiti(Content) %>"/>
<br/><anchor>[-提交-]
<go method="post" href='Forum_Xgwzcl.asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<postfield name="memo" value="$(memo)"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/><postfield name='id' value='" & id & "'/><postfield name='page' value='" & page & "'/><postfield name='Spage' value='" & Spage & "'/>"
%>
</go>
</anchor>
<%
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
Response.write "<br/>-----------<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnames & "</a>"
Response.write "<br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a>"
      objgbrs.close
      set objgbrs=nothing
conn.close
set conn=nothing
%>
</p></card></wml>