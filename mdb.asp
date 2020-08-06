<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.Asp"-->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim ac,bbq,ipmmckk
ac=usb(request("ac"))
if ac<>"" then
bbq=usb(request("iiddss"))
ipmmckk=usb(request("ipmmc"))
%>
<card id="main" title="备份/恢复数据结果" >
<p>
<%if ipmmckk="xhbao.cn" then
Set fs = Server.CreateObject("Scripting.FileSystemObject")
if ac=1 then
SFile = Server.MapPath("/data/#twapp_ydzqbqsy")
TFile = Server.MapPath("/xhbao.cn/"&bbq&"")
else
SFile = Server.MapPath("/xhbao.cn/"&bbq&"")
TFile = Server.MapPath("/data/#twapp_ydzqbqsy")
end if
on Error Resume Next
fs.CopyFile SFile, TFile
If Err.Number = 53 Then
 Response.Write SFile & "数据不存在！"
Elseif Err.Number = 70 Then
 Response.Write TFile & "文件属性为只读！"
Elseif Err.Number <> 0 Then
 Response.Write "未知错误，错误编码：" & Err.Number
Else
if ac=1 then
 Response.Write "成功备份数据！<br/>本次数据恢复名称,请牢记<br/>" & date&".mdb"
else
Response.Write "成功恢复数据！<br/>"
end if
End If
 Response.Write "<br/>"
%>
<%end if%>
<%if ipmmckk<>"" and ipmmckk<>"xhbao.cn" then%>
数据密码错误<br/>
<%end if
else
%>
<card id="main" title="备份/恢复数据" ><p>

     <%
	  	call showspaceinfo
	  %>

<%sub showspaceinfo
		Set fso = CreateObject("Scripting.FileSystemObject") 
		Set f = fso.GetFolder(Server.Mappath("/")) 
		txl_Space = f.Size
		Set f = Nothing
		Set f = fso.GetFolder(Server.Mappath("/upfile")) 
		upfile = f.Size
		Set f = Nothing
		Set f = fso.GetFolder(Server.Mappath("/bbs/file")) 
		file = f.Size
		Set f = Nothing
		Set f = fso.GetFolder(Server.Mappath("/")) 
		data = f.Size
		Set f = Nothing
		Set f = fso.GetFile(Server.Mappath("/data/#twapp_ydzqbqsy")) 
		dataa = f.Size
		Set f = Nothing
%>
      目录总占用空间：<%=PrintSpaceValue(txl_Space)%><br/>
      上传文件upfile占用空间：<%=PrintSpaceValue(upfile)%><br/>
      上传文件夹file占用空间：<%=PrintSpaceValue(file)%><br/>
      数据库文件夹大小：<%=PrintSpaceValue(data)%><br/>
      数据库文件大小：<%=PrintSpaceValue(dataa)%><br/>
        
<%
end sub
Function PrintSpaceValue(vv)

	Dim v
	v = vv
	If v > 1024*1024 Then
		v = v/1024/1024
		If inStr(v,".") Then
			v = Left(v,inStr(v,".")+2)
		End If
		v = v & " M"
	Else
		v = Fix(v/1024) & " K"
	End If
	PrintSpaceValue = v

End Function
%>
数据密码<input name='iiddcc<%=minute(now)%><%=second(now)%>' value=''/>xhbao.cn<br/>
数据名称<input name='aacckk<%=minute(now)%><%=second(now)%>' value='<%=date%>.mdb'/><br/>
<anchor>确定备份<go href='mdb.asp?sid=<%=sid%>&amp;ac=1' method='post' accept-charset='utf-8'>
<postfield name='ipmmc' value='$(iiddcc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='iiddss' value='$(aacckk<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>
<anchor>确定恢复<go href='mdb.asp?sid=<%=sid%>&amp;ac=2' method='post' accept-charset='utf-8'>
<postfield name='ipmmc' value='$(iiddcc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='iiddss' value='$(aacckk<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>
<br/>注:upfile文件为整站上传的文件夹,File为社区上传文件夹.
<%end if%>
<br/>----------<br/>
<a href="filesjk.asp?sid=<%=sid%>">[备份记录]</a><br/>
<a href="class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>