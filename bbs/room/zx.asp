<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim res,sqld
set res=server.createobject("ADODB.Recordset")
sqld="select * from gd where idd=" & id & " and idlt=" & idlt & " and jz='i'"
res.open sqld,myc,1,1
if not res.eof then
   response.write "<card title='错误!'><p>你被禁止进入该聊天室,请联系管理员</p></card></wml>"
   response.end

  else
%>
<card title="本室在线">
<p align='left'><%=now()%><br/><br/>
<%
dim p
p=request("p")
if p="" then p=1
id=request("id") 

response.write("<a href='zx.asp?id=" & id & "&amp;p=" & p & "&amp;SessionID=" & SessionID & "'>刷新列表</a><br/>")

dim rss,sql2
set rss=server.createobject("ADODB.Recordset")
sql2="select * from ooo where iidd=" & id & " and DATEDIFF('s', times, now()) < 15*60 order by times desc"
rss.open sql2,myc,1,1
	if not rss.eof then

rss.Move((p-1)*pag)
dim i
i=1
do while ((not rss.eof) and i<=cInt(pag))
dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select * from usereg where id=" & rss("idlt")
  objgbrss.open ssqls,conn,1,1
dim sex
if objgbrss("usesex")="0" then
sex="<img src='boy.gif' alt='GG'/>"
  else if objgbrss("usesex")="1" then
sex="<img src='girl.gif' alt='MM'/>"
end if
end if
  response.write ((p-1)*pag+i) & ".)" & sex & "<a href='myfy1.asp?id=" & id & "&amp;ids=" & rss("idlt") & "&amp;SessionID=" & SessionID & "'>" & ubb(objgbrss("usename")) & "ID:" & ubb(rss("idlt")) & "</a><br/>"
rss.movenext
i=i+1
loop
	if p*pag<rss.recordcount Then response.write("<a href='zx.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p+1 & "'>下一页</a>")
	if p>1 then response.write("<a href='zx.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p-1 & "'>上一页</a>")
	if pag > rss.pagecount and p>1 then response.write("<br/>")
	if pag<rss.recordcount then 
response.write("("& p & "/" & (int(rss.recordcount/pag+1)) &"/" & rss.recordcount & ")<br/>")
%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(p+1)%>" maxlength="3"/>页
    <a href="zx.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;p=$(gpage<%=minute(now)%><%=second(now)%>)">[GO]</a><br/>
<%
	end if
end if
rss.close
set rss=Nothing

response.write("----------<br/><a href='talk.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>发言</a>|<a href='zx.asp?id=" & id & "&amp;p=" & p & "&amp;SessionID=" & SessionID & "'>刷新</a><br/>")

end if
%>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">[返回聊室]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[聊天广场]</a><br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>[我的地盘]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>