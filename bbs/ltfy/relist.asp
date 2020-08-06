<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
id=cint(request("id"))
ids=cint(request("ids"))
p=cint(request("p"))
if p="" or p<1 then p=1
%>
<card title='评论列表'>
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [hf] where idd=" & id & " order by [id] desc"
rs.open rsstr,conn,1,2

if rs.recordcount = 0 then response.redirect "resave.asp?SessionID=" & SessionID & "&ids=" & ids & "&id=" & id & "&p=" & p & ""

maxpage=int((rs.recordcount-1)/pag)+1
if p>maxpage then p=maxpage

if rs.recordcount > 0  then
response.write("共" & rs.recordcount & "条评论")

response.write("<br/>------------<br/>")

   if rs.recordcount > 0 then
rs.Move((p-1)*pag)
dim j
j=1

	if p*pag<rs.recordcount then response.write("<a href='relist.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p+1 & "'>[下页]</a>&nbsp;")
	if p>1 then response.write("<a href='relist.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p-1 & "'>[上页]</a>&nbsp;")
	if p*pag<rs.recordcount or p>1 then response.write("(" & p & "/" & (int((rs.recordcount-1)/pag)+1) & ")<br/>")
do while ((not rs.EOF) and j<=clng(pag))
%>

<%=((p-1)*pag+j)%>.<%=ubb(rs("name"))%>说:<br/>
<%=ubb(rs("text"))%>(<%=ubb(rs("time"))%>)<br/>
<%
rs.MoveNext
j=j+1
loop
   end if
end if

	if p*pag<rs.recordcount then response.write("<a href='relist.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p+1 & "'>[下页]</a>&nbsp;")
	if p>1 then response.write("<a href='relist.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p-1 & "'>[上页]</a>&nbsp;")
	if p*pag<rs.recordcount or p>1 then response.write("(" & p & "/" & (int((rs.recordcount-1)/pag)+1) & ")<br/>")
%>

   <% if p*pag<rs.recordcount or p>1 then %>
<input name="page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if p>=maxpage then response.write(p-1) else response.write(p+1)%>"/>
<anchor>[跳转]
    <go href="relist.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>" accept-charset='utf-8'>
        <postfield name="p" value="$(page<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
   <% end if %>
--------------<br/>
<a href="resave.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">我要评论</a><br/>
<a href="view.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>">返回案件</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>">案件分类</a><br/>
<!--#include file="aa.asp"-->

</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>