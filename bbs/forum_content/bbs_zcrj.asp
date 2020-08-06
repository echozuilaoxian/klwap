<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
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
%>
<card  title="<%=dlname%>-操作记录">
<p>
<%
iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & ""
End if
%>
<u><%=dlname%>-操作记录</u><br/>
<%
set rst=server.createobject("adodb.recordset")
sqlssx="select * from czrj where cstr(ltid)="&ForumID&" order by id desc"
rst.open sqlssx,conn,1,1
if rst.eof and rst.bof then
	response.write "-------------<br/>"&dlname&"-暂无操作记录<br/>"
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
<%do while not rst.eof and j<=Rst.pagesize
tjhm=rst("ids")
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sql)
	rtjname=rsSS("usename")
set rsSS=nothing
%>
<%=(j+(page-1)*listnum)%>:
<%response.write "<a href='/BBS/reg/useinfo.asp?id=" & Rst("ids") & "&amp;SessionID=" & SessionID & "'>"&ubb(rtjname)&"</a>将帖子<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & Rst("ltid") & "&amp;id=" & Rst("wzid") & "&amp;page=1&amp;SessionID=" & SessionID & "'>"&ubb(Rst("tzmc"))&"(ID " & Rst("wzid") & ")</a>"&Rst("czxx")&"[操作时间"&Rst("tm")&"]<br/>"%>
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