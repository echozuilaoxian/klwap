<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card  title="审核案件">
<p>
<%
iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & ""
End if
%>
<%
 'sql="Delete FROM urls WHERE DATEDIFF('s', addtime, now()) > 1*60"
  'conn.Execute sql

set rst=server.createobject("adodb.recordset")
sqlssx="select * from urls WHERE check=0  order by id desc"
rst.open sqlssx,conn,1,1
if rst.eof and rst.bof then
	response.write "-------------<br/>暂无案件<br/>"
else

'分页的实现 
listnum=10
Rst.pagesize=listnum
page=Request("page")
if (page-Rst.pagecount) > 0 then
page=rst.pagecount
elseif page = "" or page < 1 then
page=1
end if
rst.absolutepage=page
'编号的实现
j=rst.recordcount
j=j-(page-1)*listnum
j=1
%>
<%do while not rst.eof and j<=Rst.pagesize%>


状纸标题:<%=encodestr(rst("title"))%><br/>
<%
tjhm=rst("url")
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sql)
	rtjnamer=rsSS("usename")
set rsSS=nothing
%>

原告:<a href='/bbs/reg/useinfo.asp?id=<%=rst("url")%>&amp;SessionID=<%=SessionID%>'><%=encodestr(rtjnamer)%>ID:<%=encodestr(rst("url"))%></a><br/>

<%
tjhms=rst("idid")
	sqlss="select * from usereg where CStr(id)='" & tjhms & "'"
	set rsSSs=conn.execute(sqlss)
	rtjnames=rsSSs("usename")
set rsSSs=nothing
%>
被告:<a href='/bbs/reg/useinfo.asp?id=<%=rst("idid")%>&amp;SessionID=<%=SessionID%>'><%=encodestr(rtjnames)%>ID:<%=encodestr(rst("idid"))%></a><br/>
起诉时间：<%=encodestr(rst("addtime"))%><br/>
法院判决:<%=encodestr(rst("fyzx"))%><br/>

<a href="relist.asp?idid=<%=rst("idid")%>&amp;SessionID=<%=SessionID%>&amp;ids=<%=rst("idd")%>&amp;id=<%=rst("id")%>&amp;p=<%=p%>">评论/申辩(<%=rst("hits")%>)</a><br/>
<%
if rst("sscs")=0 then 
response.write ""
end if
if rst("sscs")>0 then %>
此案件该用户上诉了<%=ubb(rst("sscs"))%>次<br/>
现在返回重审<br/>
<%end if%>

<!--#include file="admin.asp"-->
<a href="del.asp?SessionID=<%=SessionID%>&amp;idid=<%=ubb(rst("idid"))%>&amp;ids=<%=rst("idd")%>&amp;id=<%=rst("id")%>&amp;p=<%=p%>">删除</a>&nbsp;<a href="reedit.asp?idid=<%=rst("idid")%>&amp;SessionID=<%=SessionID%>&amp;ids=<%=rst("idd")%>&amp;id=<%=rst("id")%>&amp;p=<%=p%>">判决</a><br/>
<%end if%>
<%rst.movenext 
j=j+1 
loop%>
<small><%=Rst.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rst.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">&lt;&lt;</a>
      <a href="<%=name%>?ForumID=<%=ForumID%>&amp;page=<%=page-1%>&amp;SessionID=<%=SessionID%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rst.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rst.pagecount-page <> 0 then %>
      <a href="<%=name%>?ForumID=<%=ForumID%>&amp;page=<%=page+1%>&amp;SessionID=<%=SessionID%>"><b>[<%=page+1%>]</b></a>
      <a href="<%=name%>?ForumID=<%=ForumID%>&amp;SessionID=<%=SessionID%>&amp;page=<%=rst.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rst.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
  <%
rst.close
set rst=nothing
conn.close
set conn=nothing
%>
<%
Response.write "------------<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=1&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
<%=String(2-Len(Month(date)),"0") & Month(date) %>-<%=String(2-len(Day(date)),"0") & Day(date)%>:<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time)%>

</p>
</card>
</wml>