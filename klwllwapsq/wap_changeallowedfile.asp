<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rstitle=c2u(rs1("title"))
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")

rsallowedfile=rs1("allowedfile")
rsallowedfilm=rs1("allowedfilm")
rsallowedfils=rs1("allowedfils")
rsallowedfilr=rs1("allowedfilr")
rsallowedfilb=rs1("allowedfilb")

rsforceup=rs1("forceup")
rs1.close
Set rs1=nothing
%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card  title="修改文件类型">
<p>

允许上传的图片类型现有<b><%=rsallowedfile%></b><br/>
<input type="text" name="allowedfile" title="文件类型"  value="<%=rsallowedfile%>" size="20"/><br/>
<anchor >修改<go href="wap_change_save.asp?kyzc=tu&amp;adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="allowedfile" value="$(allowedfile)"/>
</go>
</anchor><br/>------------<br/>
允许上传的视频类型现有<b><%=rsallowedfilm%></b><br/>
<input type="text" name="allowedfilm" title="文件类型"  value="<%=rsallowedfilm%>" size="20"/><br/>
<anchor >修改<go href="wap_change_save.asp?kyzc=sp&amp;adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="allowedfilm" value="$(allowedfilm)"/>
</go>
</anchor><br/>------------<br/>
允许上传的软件类型现有<b><%=rsallowedfils%></b><br/>
<input type="text" name="allowedfils" title="文件类型"  value="<%=rsallowedfils%>" size="20"/><br/>
<anchor >修改<go href="wap_change_save.asp?kyzc=rj&amp;adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="allowedfils" value="$(allowedfils)"/>
</go>
</anchor><br/>------------<br/>
允许上传的铃声类型现有<b><%=rsallowedfilr%></b><br/>
<input type="text" name="allowedfilr" title="文件类型"  value="<%=rsallowedfilr%>" size="20"/><br/>
<anchor >修改<go href="wap_change_save.asp?kyzc=ring&amp;adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="allowedfilr" value="$(allowedfilr)"/>
</go>
</anchor><br/>------------<br/>
允许上传的电子书类型现有<b><%=rsallowedfilb%></b><br/>
<input type="text" name="allowedfilb" title="文件类型"  value="<%=rsallowedfilb%>" size="20"/><br/>
<anchor >修改<go href="wap_change_save.asp?kyzc=ring&amp;adminmid=<%=request("adminmid")%>" method="post" >
<postfield name="allowedfilb" value="$(allowedfilb)"/>
</go>
</anchor><br/>------------<br/>
允许上传的文件类型,多个之间用逗号分开。建议禁止上传asp等容易出现漏洞的文件。<br/>
------------<br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
<p align="center">
WAP2.0上传系统Ver1.0<br/>
<a href="/">返回首页</a>
</p>
</card>
</wml>