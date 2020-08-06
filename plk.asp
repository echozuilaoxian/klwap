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
<%dim ids,pin,id,pa,cid
ids=cint(request.QueryString("class"))
pin=request.form("pin")
id=cint(request.QueryString("id"))
pa=request.QueryString("pa")
if pa="" then pa=1
cid=cint(request.QueryString("cid"))
fileid=cint(request("id"))
ip=Request.ServerVariables("REMOTE_ADDR")
if pin="" then
response.write("评论内容不能为空！<br/>")
else
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from pin"
rs.open rsstr,conn,1,3
rs.addnew
if pin<>"" then rs("pin")=pin
if ip<>"" then rs("ip")=ip
if fileid<>"" then rs("fileid")=fileid
rs("pltime")=now()
rs.update
response.write("评论发表成功！<br/>")
rs.close
Set rs=nothing
conn.close
set conn=nothing
end if
%>
<a href='pin.asp?id=<%=id%>&amp;class=<%=ids%>&amp;cid=<%=cid%>&amp;pa=<%=pa%>&amp;hk=<%=hk%>'>查看评论</a><br/>
<a href='soft_viwe.asp?id=<%=id%>&amp;class=<%=ids%>&amp;cid=<%=cid%>&amp;pa=<%=pa%>&amp;hk=<%=hk%>'>返回</a>><a href='soft_list.asp?class=<%=ids%>&amp;cid=<%=cid%>&amp;pa=<%=pa%>&amp;hk=<%=hk%>'>栏目</a>><a href='/index.asp?hk=<%=hk%>'>首页</a>
</p>
</card>
</wml>