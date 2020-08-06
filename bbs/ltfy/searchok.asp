<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml_1.2.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
sear=request("sear")
search=request("search")
p=cint(request("p"))
if p="" or p<1 then p=1
%>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where (" & sear & " like '%" & search & "%') order by [id] desc"
rs.open rsstr,conn,1,2

if rs.eof and rs.bof then
     response.write "<card id='card1' title='系统提示'><p>没有找到你搜索的内容哦……<br/>"
Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/></p></card></wml>"
     response.end
else
%>

<card title="搜索结果">
<p>

<%
maxpage=int((rs.recordcount-1)/pag)+1
if p>maxpage then p=maxpage

response.write("搜索结果" & rs.recordcount & "个<br/>")
rs.Move((p-1)*pag)
dim j
j=1

response.write("---------<br/>")
do while ((not rs.EOF) and j<=clng(pag))

%>

<%=((p-1)*pag+j)%>.<a href='/bbs/ltfy/view.asp?SessionID=<%=SessionID%>&amp;id=<%=rs("id")%>'><%=converttowidebaiti(rs("title"))%></a><br/>
<%
rs.MoveNext
j=j+1
loop


if p*pag<rs.recordcount then response.write("<a href='searchok.asp?SessionID=" & SessionID & "&amp;sear=" & sear & "&amp;search=" & search & "&amp;p=" & p+1 & "'>[下页]</a>&nbsp;")
if p>1 then response.write("<a href='searchok.asp?SessionID=" & SessionID & "&amp;sear=" & sear & "&amp;search=" & search & "&amp;p=" & p-1 & "'>[上页]</a>&nbsp;")
if p*pag<rs.recordcount or p>1 then response.write("<br/>")
if p*pag<rs.recordcount or p>1 then response.write("(第" & p & "/" & (int((rs.recordcount-1)/pag)+1) & "页)<br/>")
%>
<%if p*pag<rs.recordcount or p>1 then%>
<input name="page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if p>=maxpage then response.write(p-1) else response.write(p+1)%>"/>
<anchor>[跳转页面]
    <go href="searchok.asp?SessionID=<%=SessionID%>&amp;sear=<%=sear%>&amp;search=<%=search%>" accept-charset='utf-8'>
        <postfield name="p" value="$(page<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%end if%>
<%
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/ltfy/search.asp?SessionID=" & SessionID & "'>继续搜索</a><br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/>"
%>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>