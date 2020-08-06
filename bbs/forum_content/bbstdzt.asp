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
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="141"
lasttls
dim jdshow,id

useid=request("id")
	sqlll="select * from usereg where CStr(id)='" & useid & "'"
	set rsSS=conn.execute(sqlll)
	rtjname=rsSS("usename")
set rsSS=nothing
Response.write "<card id='card1' title='" & converttowidebaiti(rtjname) & "的帖子'><p>"
if lycount>0 then
      Response.write "<a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&request("id")&""
End if

jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999

     ssql="select * from wuza where tjhm='" & useid & "' and itid<>'80' order by id desc"
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
   Response.write "没有帖子记录<br/>"
Else
yxxe=objgbrs.recordcount
   Response.write "" & converttowidebaiti(rtjname) & "的帖子"&converttowidebaiti(yxxe)& "条记录<br/>"

 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
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
   if objgbrs("lzdname")="y" then
     yyy="[隐]"
    else
     yyy=""
   End if

   if objgbrs("pic")="r" then
     ruan="[附件]"
    else
     ruan=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="[投]"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     li="[礼]"
    else
     li=""
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
      a="[告]"
    else
     a=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),30)
   if len(objgbrs("biaoti"))>30 then
    hfyl=hfyl+""
   End if

    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),13)
   if len(objgbrs("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if
Response.write bihao+bihaocont & "." & "" & converttowidebaiti(a) & "" & converttowidebaiti(yyy) & "" & converttowidebaiti(ljj) & "" & converttowidebaiti(bnt) & "" & converttowidebaiti(pics) & "" & converttowidebaiti(ruan) & "" & converttowidebaiti(tou) & "" & converttowidebaiti(li) & "" & converttowidebaiti(mai) & "" & converttowidebaiti(sd) & "" & converttowidebaiti(zd) & "" & converttowidebaiti(jh) & "" & converttowidebaiti(tj) & "" & converttowidebaiti(hd) & "" & converttowidebaiti(bntj) & ""
Response.write"<a href='/BBS/Forum_content/BBS_receipt_ByContent.Asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & " </a>"
    if objgbrs("hfcont")>=1 then
Response.write "&nbsp;" & converttowidebaiti(redtjname) & "(回<a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & objgbrs("hfcont") & "</a>/阅" & objgbrs("rc") & ")<br/>"
else
Response.write "&nbsp;" & converttowidebaiti(redtjname) & "(阅" & objgbrs("rc") & ")<br/>"
end if
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if



    if objgbrs.PageCount>1 then
    response.write "---------------<br/>"
End if

If page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/forum_content/bbstdzt.asp?SessionID=" & SessionID & "&amp;ID=" & useid & "&amp;page="&page+1&"'>"&converttowidebaiti("下页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("下页")& ""
End if
If page>1 then
    Response.Write "<a href='/BBS/forum_content/bbstdzt.asp?SessionID=" & SessionID & "&amp;ID=" & useid & "&amp;page="&page-1&"'>"&converttowidebaiti("上页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("上页")& ""
End if
if objgbrs.PageCount>1 then
response.write ""&converttowidebaiti("(" &  page & "/" & objgbrs.PageCount & "/" & objgbrs.RecordCount & ")")& "<br/>"
response.write "<input  name='p' value='2' size='3' format='*N'/>"&converttowidebaiti("页")& "<anchor>"&converttowidebaiti("跳页")& "<go method='post' href='/BBS/forum_content/bbstdzt.asp?SessionID=" & SessionID & "&amp;ID=" & useid & "'><postfield name='page' value='$(p)'/></go></anchor><br/>"
End if

Response.write "---------------<br/><a href='/bbs/reg/useinfo.asp?SessionID=" & SessionID & "&amp;ID=" & useid & "'>返回他的资料</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"

response.write "报时:"&time&"</p></card></wml>"

conn.close
Set objgbrs= Nothing
set conn=nothing
%>