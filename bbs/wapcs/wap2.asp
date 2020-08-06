<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include FILE="conn.asp"-->
<!--#include FILE="ltinc/char.asp"-->

<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
sq1="select * from upset where id=1"
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
rstitle=c2u(rs1("title"))
rsformPath=rs1("formPath")
rsnamekind=rs1("namekind")
rsfilesize=rs1("filesize")
rsallowedfile=rs1("allowedfile")
rsforceup=rs1("forceup")
rs1.close
Set rs1=nothing
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
</head>
<body>
警告：请勿上传违规图片。
<form name="form1" method="post" action="wapsc.asp?SessionID=<%=SessionID%>" enctype="multipart/form-data">
相片名称:<input name="usename" type="text" value="" size="20">	
<br/>相片说明:<input name="mess" type="text" value="" size="20">
<br/>选择图片:<input type="file" name="photo" value="选择图片"/><br/>
<input type="submit" name="submit" value="上  传"/>
<input type='reset' name='wap2.asp?SessionID=<%=SessionID%>' value='重　设'/> 
<br/>点击上传时,没有返回信息请不要关闭窗口。 
</form>
-------------
<br/><a href="/bbs/myalbum/index.asp?SessionID=<%=SessionID%>">返回网友相册</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p> 
</body>
</html>