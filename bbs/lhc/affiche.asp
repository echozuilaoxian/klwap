<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
kyzc=Request("kyzc")
page=Request("page")
if page="" or page < 1 then
page = 1
end if
Server.ScriptTimeout=999

set rxs=Server.CreateObject("ADODB.Recordset")
rsxQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rxs.open rsxQL,myc,1,2
if rxs.recordcount<1 then
rxs.addnew
rxs("ids")=iduse
rxs.update
end if
        rxs.Close
	Set rxs=Nothing

if kyzc="" then
%>
<card id="main" title="公告列表" >
<p>
<%
sql="select * from affiche order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,myc,1,1
if rs.eof and rs.bof then
	response.write "-------------<br/>暂无内容<br/>"
else
'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
历史公告:<small>共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<%=(j+(page-1)*listnum)%>:<b><u><a href="affiche.asp?id=<%=rs("AfficheId")%>&amp;kyzc=yxxe&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page%>"><%=ubb(rs("AfficheName"))%></a></u></b>[<%=rs("AfficheTime")%>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?SessionID=<%=request("SessionID")%>&lt;&lt;</a>
      <a href="<%=name%>?SessionID=<%=request("SessionID")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="<%=name%>?SessionID=<%=request("SessionID")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="<%=name%>?SessionID=<%=request("SessionID")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
<%
elseif kyzc="yxxe" then
id=request("id")
page=request("page")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche where AfficheId="&id
rs.open rspl,myc,1,2
if rs.eof then 
response.write("ID错误!")
else
  sql="update affiche set AfficheHots=AfficheHots+1 Where CStr(AfficheId)='" & id & "'"
  myc.Execute(sql)
%>
<card id="main" title="公告-<%=ubb(rs("AfficheName"))%>" >
<p>
<b>标题:</b><%=ubb(rs("AfficheName"))%><br/><br/>
<%=ubb2(rs("AfficheContent"))%><br/>
----------<br/>
查看次数:<%=rs("AfficheHots")%><br/>
添加时间:<%=rs("AfficheTime")%><br/>------------<br/>
<%end if
	rs.close
	set rs=nothing
%>
<a href="affiche.asp?SessionID=<%=request("SessionID")%>">返回公告列表</a><br/>
<%end if%>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=request("SessionID")%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p>
</card>
</wml>