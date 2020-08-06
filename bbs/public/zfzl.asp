<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<card id="card1" title="<%=converttowidebaiti(SystemSiteName)%>-奖罚记录"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="40"
lasttls
  dim page,bz,objgbrs
  page=request("page")
  sql="Delete FROM guestbook1 WHERE DATEDIFF('s', times, now()) > 87200*60"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook1 order by id desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
response.write "&#x6682;&#x65F6;&#x6CA1;&#x6709;&#x8BB0;&#x5F55;<br/>"
else
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?s=so"
End if
if objgbrs.eof then
Response.write "奖罚记录<br/>----------<br/>"
   Response.write "&#x6682;&#x65F6;&#x7A7A;&#x7F3A;<br/>"
 Else
Response.write "奖罚记录<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("ids")
Response.write bihao+bihaocont & "." & converttowidebaiti(redtjname) & "ID:" & objgbrs("ids") & "<br/>"
Response.write converttowidebaiti(objgbrs("niayo"))
tjhm=objgbrs("reids")
Response.write "<br/>&#x64CD;&#x4F5C;:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("reids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("reids") & "</a><br/>"
Response.write "&#x65F6;&#x95F4;:" & objgbrs("times") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.write "--------------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='zfzl.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='zfzl.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
end if

response.write("------------<br/>")
Response.write "<a href='/bbs/forum_content/Xcbgs.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区政府")&"</a><br/>"
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