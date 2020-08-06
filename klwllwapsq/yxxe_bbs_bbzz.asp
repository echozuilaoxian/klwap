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
<card id="main" title="斑竹管理" >
<p>
<a href="yxxe_bbs_tjbz.asp?adminmid=<%=request("adminmid")%>">添加斑竹</a><br/>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsppl="select * from usereg where gly<>'0' order by id desc"
rs.open rsppl,conn,1,2
if rs.eof then 
response.write("暂无斑竹<br/>")
else
pag=10
dim page,maxpage
page=cint(request.QueryString("page"))
if page="" or page<1 then page=1
maxpage=int((rs.recordcount-1)/pag)+1
if page>maxpage then page=maxpage

rs.Move((page-1)*pag)
dim l
l=1
do while ((not rs.EOF) and l <=cint(pag))
if rs("bzbz")<>0 then bbzz="总"
if rs("bzbz")=0 then bbzz="副"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&rs("gly")
rse.open rspple,conn,1,2
if rse.eof then 
bkmc="无此版块"
else
bkmc=rse("name")
end if
%>
<a href="yxxe_bbs_bbzzcl.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>">[管理]</a><%=l%>.(<%=bkmc%>) <%=ubb(rs("usename"))%>(<%=rs("id")%>)[<%=bbzz%>]<br/>
<%
rs.MoveNext
l=l+1
loop
end if
if page*pag<rs.recordcount then response.write("<a href='yxxe_bbs_bbzz.asp?adminmid="&request("adminmid")&"&amp;page=" & page+1 & "'>下一页</a>")
if page>1 then response.write("<a href='yxxe_bbs_bbzz.asp?adminmid="&request("adminmid")&"&amp;page=" & page-1 & "'>上一页</a>")
%>
----------<br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">返回版块管理</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
%>