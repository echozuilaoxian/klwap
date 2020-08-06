<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rstitle=rs1("title")
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rsforceup=rs1("forceup")
rs1.close
Set rs1=nothing
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="系统管理">
<p align="center"><%=rstitle%><br/></p>
<p>
--系统设置--<br/>
<a href="changetitle.asp?adminmid=<%=request("adminmid")%>">首页标题</a>:<%=rstitle%><br/>
<a href="changefilesize.asp?adminmid=<%=request("adminmid")%>">文件大小</a>:<%=rsfilesize%>KB<br/>
<a href="changeallowedfile.asp?adminmid=<%=request("adminmid")%>">文件类型</a>:<%=rsallowedfile%><br/>
<a href="changenamekind.asp?adminmid=<%=request("adminmid")%>">命名方式</a>:
<%If rsnamekind="1" then%>
用原名
<%else%>
重命名
<%end if%><br/>
<a href="changeformPath.asp?adminmid=<%=request("adminmid")%>">保存位置</a>:<%=rsformPath%><br/>
<a href="changeforceup.asp?adminmid=<%=request("adminmid")%>">强制上传</a>:<%If rsforceup="T" then%>
是
<%else%>
否<%End if%><br/>
-------------<br/>
<a href="showsoft.asp?adminmid=<%=request("adminmid")%>">上传文件管理</a><br/>
<a href="?adminmid=<%=request("adminmid")%>">会员系统设置</a><br/>
<a href="changepassword.asp?adminmid=<%=request("adminmid")%>">修改管理密码</a><br/>
-------------<br/>
<a href="index.asp">退出管理</a><br/>
<a href="../index.asp?adminmid=<%=request("adminmid")%>">返回首页</a>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>