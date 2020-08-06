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
fid=request("fid")
cz=request("cz")
%>
<card id="main" title="添加版主" >
<p>
选择版块<%
response.write "<select name='idp'><option>版块列表</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
 dim nini
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%><br/>
版主性质<%
response.write "<select name='bbzz'><option>选择正副</option>"
Response.write "<option value='1'>正版</option>"
Response.write "<option value='2'>副版</option>"
Response.write "</select>"%><br/>
版主ID：<input name='iidd"' format='*N' value=''/><br/>
<anchor>确认提交<go href='yxxe_bbs_tjbzcl.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='idp' value='$(idp)'/>
<postfield name='iidd' value='$(iidd)'/>
<postfield name='bbzz' value='$(bbzz)'/>
</go></anchor><br/>------------
<br/><a href="yxxe_bbs_bbzz.asp?adminmid=<%=request("adminmid")%>">返回版主管理</a><br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">返回版块管理</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>