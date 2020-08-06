<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="check.asp" -->
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
<card id="main" title="备份数据" >
<p>
<%if cz="101688" then
Set fs = Server.CreateObject("Scripting.FileSystemObject")
SFile = Server.MapPath("/admin/Database/#qqccb.mdb")
TFile = Server.MapPath("/admin/Databf/"&nnn&"")
on Error Resume Next
fs.CopyFile SFile, TFile
If Err.Number = 53 Then
 Response.Write SFile & "数据不存在！"
Elseif Err.Number = 70 Then
 Response.Write TFile & "文件属性为只读！"
Elseif Err.Number <> 0 Then
 Response.Write "未知错误，错误编码：" & Err.Number
Else
 Response.Write "成功备份数据！<br/>数据地址:" & TFile
End If
 Response.Write "<br/>"
%>
<%end if%>
<%if cz<>"" and cz<>"101688" then%>
对不起，安全码错误<br/>
<%end if%>
安全密码：<input name='iidd<%=minute(now)%><%=second(now)%>' value=''/><br/>
备份名称：<input name='dq<%=minute(now)%><%=second(now)%>' value='<%=date%>.mdb'/><br/>
<anchor>确定备份<go href='wap_databf.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='cz' value='$(iidd<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ffss' value='$(dq<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>

<br/>-------<br/>
<a href="wapadmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="../index.asp?adminmid=<%=request("adminmid")%>">返回网站首页</a><br/>
注：定期备份数据有助于出现问题时的处理<br/>
</p>
</card>
</wml>
