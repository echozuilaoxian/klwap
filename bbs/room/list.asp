<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<% 
dim sqlls
sqlls="update ooo set iidd='0' where wap='" & SessionID & "'"
myc.execute sqlls
sqlls="update ooo set idd='0' where wap='" & SessionID & "'"
myc.execute sqlls

dim sql1
sql1="delete from room where DATEDIFF('s', times, now()) > cint("& overtime &")*3600"
myc.execute sql1
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="更多聊室">
<p align='left'>
<%
dim rst,sqls
set rst=server.createobject("ADODB.Recordset")
sqls="select * from room order by id desc"
rst.open sqls,myc,1,2

  if not rst.eof then
dim p
p=request("p")
if p="" then p=1
rst.Move((p-1)*pag)
dim j
j=1
do while ((not rst.eof) and j<=cInt(pag))
  Response.write ((p-1)*pag+j) & ".<a href='rooms.asp?id=" & rst("idd") & "&amp;SessionID=" & SessionID & "'>" & ubb(rst("roomname"))& "</a>"
dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select usename from usereg where id=" & rst("idd")
  objgbrss.open ssqls,conn,1,1
  if not objgbrss.eof then
dim rss,sqll
  set rss=Server.CreateObject("ADODB.Recordset")
  sqll="select id from ooo where idd=" & rst("idd")
  rss.open sqll,myc,1,1

Response.write "  (<a href='zxs.asp?id=" & rst("idd") & "&amp;SessionID=" & SessionID & "'>" & rss.recordcount & "</a>)" 
Response.write "<br/>(" & ubb(objgbrss("usename")) & "|<a href='roomgls.asp?id=" & rst("idd") & "&amp;SessionID=" & SessionID & "'>管理</a>)"
rss.close
set rss=nothing
objgbrss.close
set objgbrss=nothing
   end if
%>
<!--#include file="admin.asp"-->
<%
  
	end if
  Response.write "<br/>"

j=j+1
rst.movenext
loop
end if

	if p*pag<rst.recordcount Then response.write("<a href='list.asp?SessionID=" & SessionID & "&amp;p=" & p+1 & "'>下一页</a>")
	if p>1 then response.write("<a href='list.asp?SessionID=" & SessionID & "&amp;p=" & p-1 & "'>上一页</a>")

if pag<rst.recordcount then 
response.write("("& p & "/" & (int(rst.recordcount/pag+1)) &"/" & rst.recordcount & ")<br/>")
%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(p+1)%>" maxlength="3"/>页
<anchor>[GO]
    <go href="list.asp?SessionID=<%=SessionID%>" accept-charset='utf-8'>
        <postfield name="p" value="$(gpage<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%
end if
rst.close
set rst=nothing
%>
----------<br/>
<a href="set.asp?SessionID=<%=SessionID%>">开设聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
If idlt=idroom Then
  Response.write "<a href='gl.asp?SessionID=" & SessionID & "'>管理员操作</a>"
End if
myc.close
set myc=nothing
%>
</p>
</card>
</wml>