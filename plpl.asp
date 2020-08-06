<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title='发表评论'>
<p>
<%ids=cint(request.QueryString("class"))
pl=request.form("pl")
id=cint(request.QueryString("id"))
p=cint(request.QueryString("p"))
smsid=cint(request("id"))
ip=Request.ServerVariables("REMOTE_ADDR")
if pl="" then
response.write("评论内容不能为空！<br/>")
else
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from pl"
rs.open rsstr,conn,1,3
rs.addnew
if pl<>"" then rs("pl")=pl
if ip<>"" then rs("ip")=ip
if smsid<>"" then rs("smsid")=smsid
rs("pltime")=now()
rs.update
response.write("评论发表成功！<br/>")
rs.close
Set rs=nothing
conn.close
set conn=nothing
end if
%>
<a href='pl.asp?id=<%=id%>&amp;class=<%=ids%>&amp;p=<%=p%>&amp;hk=<%=hk%>'>查看评论</a><br/>
<a href='viwe.asp?id=<%=id%>&amp;class=<%=ids%>&amp;p=<%=p%>&amp;hk=<%=hk%>'>返回</a>><a href='list.asp?class=<%=ids%>&amp;hk=<%=hk%>'>栏目</a>><a href='/index.asp?hk=<%=hk%>'>首页</a>
</p>
</card>
</wml>