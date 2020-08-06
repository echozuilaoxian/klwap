<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
page=Request("page")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="337"
lasttls
dim page,Rs
Response.Write "<card id='card1' title='社区管理员列表'><p>"

if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=1"
End if

set Rs=Server.CreateObject("ADODB.Recordset")
  rspl="select * from usereg where CStr(gly)<>'0' or CStr(yxxezb)<>'0' or CStr(yxxexc)<>'0' or CStr(cg)<>'0' or CStr(cw)<>'0' or CStr(yxxegg)<>'0' order by bzbz desc"
Rs.open rspl,conn,1,2
if Rs.eof then
   Response.write "暂无操作记录<br/>"
else
'分页的实现 
listnum=30
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
<b>社区管理员列表</b><br/><small>排名不分先后</small><b><%=Rs.recordcount%></b><small>个成员</small><br/>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<%do while not rs.eof and j<=listnum%>
<%

Response.Write "<a href='/BBS/reg/useinfo.asp?id=" & Rs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(Rs("usename")) & "ID:" & Rs("id") & "</a>"&frionline&"<br/>"

if rs("gly")<>"0" then
if rs("bzbz")<>"0" then bbzz="版主"
if rs("bzbz")="0" then bbzz="副版"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&rs("gly")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if

Response.write "[职务:<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID="&rs("gly")&"&amp;SessionID=" & SessionID & "'>"&bkmc&"</a>"&bbzz&"]<br/>"
else
if rs("yxxezb")<>0 then bbzz="社区总管"
if rs("yxxexc")<>0 then bbzz="论坛巡查"
if rs("cw")<>0 then bbzz="社区法官"
if rs("cg")<>0 then bbzz="论坛彩管"
if rs("yxxegg")<>0 then bbzz="站长"
Response.write "[职务:"&bbzz&"]<br/>"
end if

rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?SessionID=<%=SessionID%>">首頁</a>
      <a href="<%=name%>?SessionID=<%=SessionID%>&amp;page=<%=page-1%>"><b><%=page-1%></b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b><%=page%></b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="<%=name%>?SessionID=<%=SessionID%>&amp;page=<%=page+1%>"><b><%=page+1%></b></a>
      <a href="<%=name%>?SessionID=<%=SessionID%>&amp;page=<%=rs.pagecount%>">尾頁</a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
<%

Response.write "<br/><a href='/bbs/forum_content/Xcbgs.asp?SessionID=" & SessionID & "'>返回社区政府</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
</p>
</card>
</wml>
<%
Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & Rs("id") & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="<img src='/bbs/Forum_Content/online_m.gif'  alt='&#x5728;&#x7EBF;'/>"
  else
  frionline="<img src='/bbs/Forum_Content/offline.gif'  alt='&#x79BB;&#x7EBF;'/>"
  end if
  set objgbrr=nothing
End function
%>