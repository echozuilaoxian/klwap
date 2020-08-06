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
<%
nnn=(request("ffss"))
cz=(request("cz"))
%>
<card id="main" title="恢复数据" >
<p>
<%if cz="101688" then
Set fs = Server.CreateObject("Scripting.FileSystemObject")
SFile = Server.MapPath("/admin/Databf/"&nnn&"")
TFile = Server.MapPath("/admin/Database/#yxxe.mdb")
on Error Resume Next
fs.CopyFile SFile, TFile
If Err.Number = 53 Then
 Response.Write SFile & "数据不存在！"
Elseif Err.Number = 70 Then
 Response.Write TFile & "文件属性为只读！"
Elseif Err.Number <> 0 Then
 Response.Write "未知错误，错误编码：" & Err.Number
Else
 Response.Write "成功回复数据！<br/>"
End If
 Response.Write "<br/>"
%>
<%end if%>
<%if cz<>"" and cz<>"101688" then%>
对不起，安全码错误<br/>
<%end if%>

恢复数据前请确认你有备份数据！<br/>
安全密码：<input name='iidd<%=minute(now)%><%=second(now)%>' value=''/><br/>
数据名称：<input name='dq<%=minute(now)%><%=second(now)%>' value=''/>(输入备份地址最后一个/后面的内容，例如：2008-1-13.mdb)<br/>

<anchor>确定恢复<go href='wap_hfsj.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='idp' value='$(idp)'/>
<postfield name='cz' value='$(iidd<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ffss' value='$(dq<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>

<br/>-------<br/>
<a href="wapadmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="../index.asp?adminmid=<%=request("adminmid")%>">返回网站首页</a><br/>
报时:<%=time%></p>
</card>
</wml>
