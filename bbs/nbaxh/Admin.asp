<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="<%=ubb(title)%>-后台管理" >
<p align='<%=duiji%>'>
<%
 if logo<>"" then 
    response.write "<img src='"&logo&"' alt='"&ubb(Url)&"'/><br/>"
end if
%>
<%=Now%>
</p>
<p align="left">

<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

dim ky,kyzc
  ky=request.querystring("ky")
  if ky="" then
	ky=1
  end if
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where tm='t' "
  objgbrc.open ssql6,myc,1,1
if objgbrc.EOF then
Response.write "暂时没有未结束的球赛.<a href='Admin2.asp?SessionID=" & SessionID & "'>开设球赛</a><br/>"
else
Response.write "<a href='Admin2.asp?SessionID=" & SessionID & "'>开设球赛</a><br/>"
objgbrc.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrc.PageCount then pages=objgbrc.PageCount
objgbrc.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrc.PageSize 
 bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "第" &objgbrc("id")& "场:" & objgbrc("ds") & "VS" & objgbrc("dx") & ""
Response.write "|<a href='Admin1.asp?id=" & objgbrc("id") &"&amp;SessionID=" & SessionID & "'>结束球赛</a>|<a href='Admin2.asp?ky=3&amp;kd=" &objgbrc("id")& "&amp;SessionID=" & SessionID & "'>修改</a><br/>"
objgbrc.Movenext
if objgbrc.EOF then Exit for
 Next
End if
If pages<objgbrc.PageCount then
Response.Write "<a href='/Admin.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='Admin.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrc.PageCount>1 then
response.write "(" & pages & "/" & objgbrc.PageCount & ")<br/>"
End if
objgbrc.close
Set objgbrc= Nothing
%>
<br/>--------------<br/>严禁任何管理员利用权力之便开奖为自己获利,一经发现取消其管理资格<br/>
<a href="Admin_system.asp?SessionID=<%=SessionID%>">网站设置</a>-<a href="admin_affiche.asp?SessionID=<%=SessionID%>">公告管理</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=SessionID%>&amp;Action=delky">删除数据</a>-<a href="Index.Asp?SessionID=<%=SessionID%>">球赛博彩</a><br/>
--------------<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
<%else%>
你没有这个权力<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
<%End if
%>
</p></card></wml>
<%
myc.close
set myc=nothing%>