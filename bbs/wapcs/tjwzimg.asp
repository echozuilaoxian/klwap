<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include FILE="conn.asp"-->
<!--#include FILE="ltinc/char.asp"-->
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "对不起,您的发表权已被锁，请与管理员联系" 
    response.end
End if

SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
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
<title><%=rstitle%></title>
</head>
<body>
警告：请勿上传违规图片。<br/>
允许上传:<%=rsallowedfile%>格式
<form enctype='multipart/form-data' action ='tzjwccl.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>' method='post' Accept-Charset='utf-8'/>
文件标题(必填):<input type='text' name='title' title='文件名称'  value='' size='20' maxlength='20'/><br/>
选择文件(路径):<input type="file" name="photo" value="选择文件"/><br/>
<input type="submit" name="submit" value="上  传"/>
<input type='reset' name='up.asp' value='重　设'/> 
</form> <br/>
点击上传时,没有返回信息请不要关闭窗口。<br/>
<%
Response.Write "<a href='/BBS/Forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回发普通帖</a>"%>
<br/>
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
<a href='/BBS/forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>'>返回<%=dlname %></a>
<br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</body>
</html>
