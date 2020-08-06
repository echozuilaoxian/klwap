<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
page=int(request("page"))
iduse=myid

forumID=request("forumID")
   if Clng(forumID)<1 then
       response.end
   End if
lasttlss=ForumID
lasttlls=ForumID
lasttls
%>
<!--#include file="contensx.asp"-->

<card id='main' title='<%=converttowidebaiti(SystemSiteName)%>-<%=converttowidebaiti(dlname)%>'><p align='<%=Systemdj%>'>
<%
if lycount>0 then
      Response.write "<a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID="&ForumID&"&amp;page="&page&"&amp;Sort="&Sort&""
End if

dim jdshow,page
jdshow=CLng(showjd)
ID=request("ID")
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from wuza where juanti="&ID &"  order by times desc "
objgbrs.open ssql,conn,1,1
objgbrs.PageSize=jdshow

page=CLng(request("page"))
if page="" or page<=0 then
   page=1
End if
if page>objgbrs.pagecount then
   page=objgbrs.pagecount
End if



if objgbrs.eof then
 Response.write "&#x6CA1;&#x6709;&#x5E16;&#x5B50;&#x8BB0;&#x5F55;<br/>-------------<br/>"
else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page * jdshow-jdshow
   End if
If Page<objgbrs.PageCount and Page>=2 then
    Response.Write "<a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;ID=" & ID & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;ID=" &ID & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 and Page>=2 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/>"
End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),30)
   if len(objgbrs("biaoti"))>30 then
    hfyl=hfyl+""
   End if
Response.write ""&bihao+bihaocont & ":"
Response.write"<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & " </a><br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next


ID=request("ID")
If Page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/forum_content/bbs_zt.asp?ForumID=" & ForumID & "&amp;ID=" & ID & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/forum_content/bbs_zt.asp?ForumID=" & ForumID & "&amp;ID=" & ID & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a><a href='/BBS/forum_content/bbs_zt.asp?ForumID=" & ForumID & "&amp;ID=" & ID & "&amp;SessionID=" & SessionID & "'>首页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/><input  name='page' value='2' size='2' format='*N'/><anchor>&#x8DF3;&#x9875;<go method='post' href='/BBS/forum_content/bbs_zt.asp?ID=" & ID & "&amp;SessionID=" & SessionID & "'><postfield name='SORt' value='" & SORt & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='$(page)'/></go></anchor><br/>"
end if
 End if
    Response.Write "-------------<br/>"

objgbrs.close
Set objgbrs= Nothing
response.write "<a href='/bbs/forum_content/bbs_ltzt.asp?ForumID="&ForumID&"&amp;SessionID=" & SessionID & "'>返回专题</a><br/>"

response.write "<a href='/bbs/forum_content/ContentlisT.asp?ForumID="&ForumID&"&amp;SessionID=" & SessionID & "'>返回"&converttowidebaiti(dlname)&"</a><br/><a href='/bbs/ztlb.asp?SessionID=" & SessionID & "'>论坛</a>><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x793E;&#x533A;</a>><a href='/index.asp?SessionID=" & SessionID & "'>&#x7F51;&#x7AD9;</a><br/>"
%>
<small>
<% 
dim kkwap,distime
kkwap=""
KYAA=right(""&WeekDayName(DatePart("w",Now)),1)
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write converttowidebaiti(KYAA)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small></p></card></wml>
<% 

conn.close
set conn=nothing
%>