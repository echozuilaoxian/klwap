<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
 <head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%id=request("id")
if id="" then id="99999999999999"
iidd=request("iidd")
idp=request("idp")
idp=clng(idp)
cz=request("bbzz")

%>
<card id="main" title="添加版主" >
<p>
<%if idp="" or cz="" or iidd="" then%>
各项不能留空
<%elseif cz="1" then%>
设置总版成功。。
<%
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&iidd
rs.open rspl,conn,1,2
rs("gly")=idp
rs("bzbz")=idp
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
<%elseif cz="2" then%>
设置副版成功。。
<%
sql="update usereg set gly='"&idp&"' where clng(id)="&iidd
  conn.Execute(sql)
%>
<%else%>
未知错误！
<%end if%>
<br/>------------
<br/>
<a href="yxxe_bbs_bbzz.asp?adminmid=<%=request("adminmid")%>">返回版主管理</a><br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">返回版块管理</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>