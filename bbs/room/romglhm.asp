<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="聊室黑名单">
<p align='left'>
<%
dim rrs,sqls,t
t=request("t") 
set rrs=server.createobject("ADODB.Recordset")
sqls="select * from rom where idd=" & id & " order by id desc"
rrs.open sqls,myc,1,1
if rrs.eof then
response.write "该聊天室不存在!<br/><br/>"
response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊吧大厅</a></p></card></wml>"
response.end
end if
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from gd gl where idd=" & id & " and jz<>'0' order by id desc"
rs.open sql,myc,1,1
if rs.eof then
response.write "目前还没有黑名单<br/>"
  else
rs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>rs.PageCount then pages=rs.PageCount
rs.absolutepage=pages
response.write "聊室黑名单<br/>"
Response.write "共有" & rs.RecordCount & "名<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to rs.PageSize 
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "."

dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select usename from usereg where id=" & rs("idlt")
  objgbrss.open ssqls,conn,1,1

response.write "<a href='/bbs/reg/useinfo.asp?id=" & ubb(rs("idlt")) & "&amp;SessionID=" & SessionID & "'>" & ubb(objgbrss("usename")) & "ID:" & ubb(rs("idlt")) & "</a><br/>"
   response.write "理由:" & ubb(rs("bz")) & "<br/>"
rs.Movenext
if rs.EOF then Exit for
 Next
End if
If pages<rs.PageCount then
Response.Write "<a href='romgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "&amp;t=" & t & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='romgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "&amp;t=" & t & "'>上页</a>"
End if
if rs.PageCount>1 then
response.write "(" & pages & "/" & rs.PageCount & ")<br/>"
End if
%>
---------<br/>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">返回聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">聊天大厅</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>