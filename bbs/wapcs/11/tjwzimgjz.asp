<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include FILE="conn.asp"-->
<!--#include FILE="ltinc/char.asp"-->
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
ids=request("id")
page=request("page")
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
<title><%=rstitle%>-续传附件</title>
</head>
<body>
<%
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "对不起,您的发表权已被锁，请与管理员联系" 
else
%>
续传附件<br/>
<form enctype='multipart/form-data' action ='/BBS/WapCs/tzjwcjz.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;page=<%=page%>' method='post' Accept-Charset='utf-8'/>
选择文件:<input type="file" name="photo" value="选择文件"/><br/>
<input type="submit" name="submit" value="上  传"/>
<input type='reset' name='up.asp' value='重　设'/> 
</form>
<br/>点击上传时,没有返回信息请不要关闭窗口。 <br/>
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
%>-------------<br/>
<%response.write "<a href='/BBS/Forum_Content/BBS_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & ids & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"%>
<br/>
<%
Response.write "<a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
end if
%>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</body>
</html>
