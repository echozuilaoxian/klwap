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
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim rs,recordcount,xxx,id,lx,cc
id= int(request.QueryString("id"))
lx= int(request.QueryString("lx"))
if id="" then id=0 
cc= request.QueryString("cc")
if cc<>"" then%>
<card id="main" title="首页栏目重新排序" ontimer="class.asp?sid=<%=sid%>">
<timer value="10"/>
<p>
<% set rs=server.CreateObject("adodb.recordset")
sql="select * from class where parent=0"
rs.open sql,conn,3,3 
If Not rs.Eof Then
j=1
do while ((not rs.EOF) and j <=500000)
rs("pid")=j
rs.update
rs.MoveNext
j=j+1
loop
Else
eer="重新排序失败!可能暂时没有栏目！"
End if
rs.close
set rs=Nothing
conn.close
set conn=nothing
%>
<%if eer="" then%>
栏目重新排序成功！正在返回...
<%else%>
<%=eer%>
<%end if%>
<br/>----------<br/>
<%else%>
<card id="main" title="首页栏目重排序"> <p>
注意:本操作将重新排序栏目，栏目序号会从1开始排序.可能使你的排序变得凌乱！确定要重排吗？
<br/>
<a href="lmpx.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lx%>&amp;cc=1">是,确定重排</a><br/>
<a href="Class.asp?sid=<%=sid%>">不,取消操作</a><br/>
<%end if%>
<a href="class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
