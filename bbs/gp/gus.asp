<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="股神排行"><p>股神排行<br/>----------<br/>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
 dim page,objgbrs
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
 ssql="select top 100 id,usename,mybbwj from usereg order by mybbwj desc"
  objgbrs.open ssql,conn,1,3
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "(" & objgbrs("mybbwj") & "股)</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next

Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='gus.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='gus.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
%>
<!--#include file="bb.asp" -->
</p></card></wml><%
conn.close
set objgbrs=nothing
set conn=nothing
%>



