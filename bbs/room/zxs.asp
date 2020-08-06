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
sqld="select * from gl where idd=" & id & " and idlt=" & idlt & " and jz='i'"
res.open sqld,myc,1,1
if not res.eof then
   response.write "<card title='错误!'><p>你被禁止进入该聊天室,请联系管理员</p></card></wml>"
   response.end
end if

dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from room where idd=" & id
rs.open sql,myc,1,1

if rs.eof then
  Response.write "<card title='使用时间已到'><p>本聊室使用时间已到,如果想继续聊,请开房者重新开启,记录还能保存。<br/><br/>"
  else
%>
<card title="本室在线">
<p align='left'><%=now()%><br/><br/>
<%
dim tt,p,t
tt=timer()
p=request("p")
if p="" then p=1
t=request("t") 
id=request("id")
if t="" then t="400"

response.write("<a href='zxs.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p & "&amp;t=" & t & "&amp;tt=" & tt & "'>刷新列表</a><br/>")

dim rss,sql2
set rss=server.createobject("ADODB.Recordset")
sql2="select * from ooo where idd=" & id & " and DATEDIFF('s', times, now()) < 15*60 order by times desc"
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
if objgbrss("usesex")="男" then
sex="<img src='boy.gif' alt='GG'/>"
  else if objgbrss("usesex")="女" then
sex="<img src='girl.gif' alt='MM'/>"
end if
end if
  response.write ((p-1)*pag+i) & ".)" & sex & "<a href='myfy.asp?id=" & id & "&amp;ids=" & rss("idlt") & "&amp;SessionID=" & SessionID & "&amp;t=" & t & "'>" & ubb(objgbrss("usename")) & "ID:" & ubb(rss("idlt")) & "</a><br/>"
rss.movenext
i=i+1
loop
	if p*pag<rss.recordcount Then response.write("<a href='zxs.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p+1 & "&amp;t=" & t & "'>下一页</a>")
	if p>1 then response.write("<a href='zxs.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p-1 & "&amp;t=" & t & "'>上一页</a>")
	if pag > rss.pagecount and p>1 then response.write("<br/>")
	if pag<rss.recordcount then 
response.write("("& p & "/" & (int(rss.recordcount/pag+1)) &"/" & rss.recordcount & ")<br/>")
%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(p+1)%>" maxlength="3"/>页
    <a href="zxs.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>&amp;p=$(gpage<%=minute(now)%><%=second(now)%>)">[GO]</a><br/>
<%
	end if
end if
rss.close
set rss=Nothing

response.write("----------<br/><a href='add.asp?id=" & id & "&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>发言</a>|<a href='zxs.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p & "&amp;t=" & t & "&amp;tt=" & tt & "'>刷新</a><br/>")

end if
%>
<a href="rooms.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;t=<%=t%>">返回聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回聊室列表</a><br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-
<!--#include file="aa.asp"-->
<%
rs.close
set rs=nothing
myc.close
set myc=nothing
%>
</p>
</card>
</wml>