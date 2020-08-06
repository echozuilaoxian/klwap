<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card  title="社区法院">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & ""
End if
%>
<a href="/bbs/ltfy/add.asp?SessionID=<%=SessionID%>">我要起诉</a>-<a href="/bbs/ltfy/search.asp?SessionID=<%=SessionID%>">案件搜索</a><br/>

<%
 'sql="Delete FROM urls WHERE DATEDIFF('s', addtime, now()) > 1*60"
 'conn.Execute sql

set rst=server.createobject("adodb.recordset")
sqlssx="select * from urls order by id desc"
rst.open sqlssx,conn,1,1
if rst.eof and rst.bof then
	response.write "--------------<br/>暂无案件记录<br/>"
else

'分页的实现 
listnum=5
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


<%=(j+(page-1)*listnum)%>:状纸标题:<a href='/bbs/ltfy/view.asp?id=<%=rst("id")%>&amp;SessionID=<%=SessionID%>'><%=encodestr(rst("title"))%></a><br/>
<%
tjhms=rst("idid")
	sqlss="select * from usereg where CStr(id)='" & tjhms & "'"
	set rsSSs=conn.execute(sqlss)
	rtjnames=rsSSs("usename")
set rsSSs=nothing
%>

原告:<a href='/bbs/reg/useinfo.asp?id=<%=rst("idid")%>&amp;SessionID=<%=SessionID%>'><%=encodestr(rtjnames)%>ID:<%=rst("idid")%></a><br/>

<%
tjhm=rst("url")
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sql)
	rtjnamer=rsSS("usename")
set rsSS=nothing
%>

被告:<a href='/bbs/reg/useinfo.asp?id=<%=rst("url")%>&amp;SessionID=<%=SessionID%>'><%=encodestr(rtjnamer)%>ID:<%=rst("url")%></a><br/>

起诉时间:<%=encodestr(rst("addtime"))%><br/>
审判结果:<%=encodestr(rst("fyzx"))%><br/>

<!--#include file="admin.asp"-->
<a href="/bbs/ltfy/del.asp?SessionID=<%=SessionID%>&amp;idid=<%=rst("idid")%>&amp;ids=<%=rst("idd")%>&amp;id=<%=rst("id")%>&amp;page=<%=page%>">删除案件</a>
<%
if rst("check")=0 then
%>
<a href="reedit.asp?idid=<%=rst("idid")%>&amp;SessionID=<%=SessionID%>&amp;ids=<%=rst("idd")%>&amp;id=<%=rst("id")%>&amp;page=<%=page%>">判决案件</a><br/>
<%else
Response.write "已经判决<br/>"
end if%>
<%end if%>

<%rst.movenext 
j=j+1 
loop%>
<small><%=Rst.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rst.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="/bbs/ltfy/index.asp?page=<%=page%>&amp;SessionID=<%=SessionID%>">&lt;&lt;</a>
      <a href="/bbs/ltfy/index.asp?page=<%=page-1%>&amp;SessionID=<%=SessionID%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rst.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rst.pagecount-page <> 0 then %>
      <a href="/bbs/ltfy/index.asp?page=<%=page+1%>&amp;SessionID=<%=SessionID%>"><b>[<%=page+1%>]</b></a>
      <a href="/bbs/ltfy/index.asp?SessionID=<%=SessionID%>&amp;page=<%=rst.pagecount%>">>></a>
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
Response.write "--------------<br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
<%=String(2-Len(Month(date)),"0") & Month(date) %>-<%=String(2-len(Day(date)),"0") & Day(date)%>:<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time)%>

</p>
</card>
</wml>