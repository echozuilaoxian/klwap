<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<% LANGUAGE="VBSCRIPT" %>
<!--#include file="conn.asp"-->
<!--#include file="ubb.inc"-->
<wml>
<%
page=request("page")
if page="" then page="1"
Server.ScriptTimeout=999

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ppage="&ppage&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
pag=10%>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="社区广播" ontimer="/bbs/xhgg/ggjl.asp?mm=<%=time%>&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>">
<timer value="9999999"/>
<p>
<% 
dim rs,rsstr
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select lid,name,txt,tm from l order by tm desc"
rs.open rsstr,conn,1,2

if rs.eof then 
response.write("暂无广播！<br/>")
else
%>

<%
response.write("〓广播记录〓<br/>")
dim page,maxpage
page=cint(request.QueryString("page"))
if page="" or page<1 then page=1
maxpage=int((rs.recordcount-1)/pag)+1
if page>maxpage then page=maxpage

rs.Move((page-1)*pag)
dim j
j=1
do while ((not rs.EOF) and j <=cint(pag))
%>

<%=((page-1)*pag+j)%>.<a href='/bbs/reg/useinfo.asp?SessionID=<%=SessionID%>&amp;id=<%=rs("lid")%>'><%=rs("name")%></a>:<%=rs("txt")%><br/>
[<%=rs("tm")%>]
<br/>

<%
    rs.Movenext  
j=j+1
loop
end if

if page*pag<rs.recordcount then response.write("<a href='ggjl.asp?SessionID=" & SessionID & "&amp;page=" & page+1 & "'>下一页</a>")
if page>1 then response.write("<a href='ggjl.asp?SessionID=" & SessionID & "&amp;page=" & page-1 & "'>上一页</a>")

if page*pag<rs.recordcount or page>1 then response.write("<br/>")
if page*pag<rs.recordcount then response.write("----------<br/>("& page & "/" & (int(rs.recordcount/pag+1)) &"/" & rs.recordcount & ")<br/>")
%>

<%if page*pag<rs.recordcount or page>1 then%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(page+1)%>" maxlength="3"/>页
<a href="ggjl.asp?SessionID=<%=SessionID%>&amp;page=$(gpage<%=minute(now)%><%=second(now)%>)">[GO]</a><br/>
<%end if%>
----------<br/>
<a href='/bbs/xhgg/gg.asp?SessionID=<%=SessionID%>'>我要广播</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>