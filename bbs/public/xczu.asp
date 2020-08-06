<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="<%=converttowidebaiti(SystemSiteName)%>-监狱">
<p align='left'>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?s=so"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="132"
lasttls
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "对不起,您的进入权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if

if lycount>0 then
   Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>你有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?s=so"
End if

dim page,bz,objgbrs,tjhm,t
t=request("t") 
if t="" then t="id"
if t="1" then t="useage"
if t="2" then t="lasttime"
if t="3" then t="usejf"
Set objgbrs=Server.CreateObject("ADODB.Recordset")
sql="select * from usereg where ftsdbz='t' or ftsdbz='x' or lysdbz='t' order by " & t & " desc"
objgbrs.open sql,conn,3,3
if objgbrs.eof then
 Response.write "<img src='/bbs/jy.gif' alt=''/><br/>"&converttowidebaiti(SystemSiteName)&"-黑名单<br/>--------------<br/>"
      Response.write "暂时没有记录<br/>"
 Else
 Response.write "<img src='/bbs/jy.gif' alt=''/><br/>"&converttowidebaiti(SystemSiteName)&"-黑名单<br/>--------------<br/>"
   objgbrs.PageSize=5
   pages =CLng(Request("pages"))
   if pages<1 then pages=1
   if pages>objgbrs.PageCount then pages=objgbrs.PageCount
   objgbrs.absolutepage=pages
   if pages=1 then
      bihao=0
   Else
      bihao=pages*objgbrs.PageSize-objgbrs.PageSize
   End if
   For k=1 to objgbrs.PageSize
      bihaocont=bihaocont+1
      Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "</a>&#40;ID:" & objgbrs("id") & "&#41;<br/>"
      if objgbrs("ftsdbz")="t" then
      Response.write "<b>发帖权被锁</b><br/>" 
      End if
      if objgbrs("ftsdbz")="x" then
      Response.write "<b>进入权被锁</b><br/>"
      End if
      if objgbrs("lysdbz")="t" then
      Response.write "<b>发信权被锁</b><br/>"
      End if
     tjhm=objgbrs("fsczg")
      Response.write "<u>执行人</u>:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("fsczg") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a>&#40;ID:" & objgbrs("fsczg") & "&#41;<br/>"
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("Counter")="pass_numbers_55556666" then
      Response.write "<u>管理</u>:<a href='/bbs/public/ffscz1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>解锁操作</a><br/>"
End if
      objgbrs.Movenext
      if objgbrs.EOF then Exit for
   Next
End if
if objgbrs.PageCount>1 then
Response.write "--------------<br/>"
End if
If pages>1 then
   Response.Write "<a href='xczu.asp?t="&t&"&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上一页</a>"
   if pages=objgbrs.PageCount then
      'Response.write "下一页"
   End if
End if
If pages<objgbrs.PageCount then
   if Pages=1 then 
      'Response.Write "上一页"
   End if
   Response.Write "<a href='xczu.asp?t="&t&"&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
   Response.write "<input name='pages' size='4' maxlength='5' value='2' format='*N'/>页<anchor>跳页<go method='post' href='xczu.asp?t="&t&"&amp;page=" & page & "&amp;SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor><br/>"
End if

response.write("------------<br/>")
Response.write "<a href='/bbs/xh6666/Xcbgs.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区政府")&"</a><br/>"
Response.write "<a href='/bbs/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区首页")&"</a><br/>"
%>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small>
</p></card></wml>
<%conn.close
set objgbrs=nothing
set conn=nothing%>

