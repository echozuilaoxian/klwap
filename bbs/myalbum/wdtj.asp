<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="自我推荐相册">
<p align="left"><%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  dim objgbrs1
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where bz='1' and biaozi='d' order by times desc"
  objgbrs1.open ssql,conn,3,3
if objgbrs1.eof then
   Response.write "<br/>暂时没有新上传相片<br/>"
  else
objgbrs1.PageSize=3
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs1.PageCount then pages=objgbrs.PageCount
objgbrs1.absolutepage=pages
Response.write "自我推荐相册共有" & objgbrs1.RecordCount & "张<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrs1.PageSize
tjhm=objgbrs1("ids")
Response.write "<a href='/bbs/myalbum/myalbum.asp?id=" & objgbrs1("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs1("xclink") & "' width='40' height='50' alt='相'/></a><br/>标题:<a href='/bbs/myalbum/myalbum.asp?id=" & objgbrs1("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs1("niayo")) & "</a>(" & objgbrs1("re") &"回/" & objgbrs1("click") &"阅)<br/>时间:"& objgbrs1("times")&"<br/>主人:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs1("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs1("ids") & "</a><br/>"
objgbrs1.Movenext
if objgbrs1.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs1.PageCount then
Response.Write "<a href='wotj.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='wotj.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs1.PageCount>1 then
response.write "(" & pages & "/" & objgbrs1.PageCount & ")<br/>"
response.write "<input  name='pages' value='2' size='2' format='*N'/>页<anchor>跳页<go method='post' href='wotj.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor>"
End if
conn.close
set conn=nothing
set objgbrs1=nothing
%> 
<br/><a href='/bbs/wapcs/wap2.asp?SessionID=<%=SessionID%>'>上传相片(WAP2.0)</a>
<br/><a href='index.asp?SessionID=<%=SessionID%>'>返回相册</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p></card></wml>