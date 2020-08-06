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
<card id="card1" title="Yxxe.Net全部帖子"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="144"
lasttls
dim jdshow
jdshow=CLng(Session("showjd"))
 san="f"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select * from wuza where san='" & san & "' and itid<>'80' order by id desc"
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then
Response.write "论坛所有帖子<br/>---------<br/>"
   Response.write "<br/>暂时没有帖子"
Else
Response.write "论坛所有帖子<br/>---------<br/>"
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    bihaocont=bihaocont+1
    tjhm=objgbrs("tjhm")
   if objgbrs("jh")="t" then
     jh="[精]"
    else
     jh=""
   End if
   if objgbrs("pic")="k" then
     pics="[图]"
    else
     pics=""
   End if
   if objgbrs("pic")="l" then
     ljj="[链]"
    else
     ljj=""
   End if
   if objgbrs("pic")="r" then
     ruan="[附件]"
    else
     ruan=""
   End if
   if objgbrs("lzdname")="y" then
     yyy="[隐]"
    else
     yyy=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="[投]"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     lis="[礼]"
    else
     lis=""
   End if

   if objgbrs("maimai")="k" then
     mai="[卖]"
    else
     mai=""
   End if

 if objgbrs("tj")="t" then
     tj="[荐]"
    else
     tj=""
   End if
 if objgbrs("hd")="t" then
     hd="[活]"
    else
     hd=""
   End if
 if objgbrs("bntj")="t" then
   bntj="[名]"
    else
     bntj=""
   End if
 if objgbrs("bntjyy1")="t" then
    bnt="[锁]"
    else
     bnt=""
   End if
   if objgbrs("times")="2100-10-10 12:12:12" then
     zd="[顶]"
    else
     zd=""
   end if
if objgbrs("times")="2000-10-10 12:12:12" then
     sd="[底]"
 else 
 sd=""
End if
 if objgbrs("a")="t" then
      ggg="[告]"
    else
     ggg=""
   End if
    hfyl=left(objgbrs("biaoti"),13)
   if len(objgbrs("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if
Response.Write bihao+bihaocont & "." & "" & converttowidebaiti(ggg) &"" &  converttowidebaiti(zd) &"" & converttowidebaiti(yyy) &"" & converttowidebaiti(jh) &"" & converttowidebaiti(tj) &"" & converttowidebaiti(hd) &"" & converttowidebaiti(bntj) &"" & converttowidebaiti(pics) &"" &converttowidebaiti(ljj) &"" & converttowidebaiti(ruan) &"" & converttowidebaiti(tou) &"" & converttowidebaiti(lis) &"" & converttowidebaiti(mai) &""
Response.write"<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a>"
if objgbrs("hfcont")>=1 then
Response.write "<small>&nbsp;" & converttowidebaiti(redtjname) & "(回<a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & objgbrs("hfcont") & "</a>/阅" & objgbrs("rc") & ")</small><br/>"
else
Response.write "<small>&nbsp;" & converttowidebaiti(redtjname) & "(阅" & objgbrs("rc") & ")</small><br/>"
end if
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
    response.write "------------<br/>"
If page<objgbrs.PageCount then
    Response.Write "<a href='" & name & "?page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下一页</a>"
 else 
    Response.Write "下一页"
End if
If page>1 then
    Response.Write "<a href='" & name & "?page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上一页</a>"
 else 
    Response.Write "上一页"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "<small>[共" & objgbrs.RecordCount & "帖第" &  page & "&#47;" & objgbrs.PageCount & "页]</small><br/>"
if objgbrs.PageCount>1 then
response.write "<small>转至第<input  name='p' value='2' size='2' format='*N'/>页<br/><anchor>确定<go method='post' href='" & name & "?SessionID=" & SessionID & "'><postfield name='page' value='$(p)'/></go></anchor></small>"
End if
  if p=<1 or p>1 then
  End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a>"
response.write "<br/><small>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</small></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>