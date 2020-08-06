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
SessionID=request.querystring("SessionID")
Response.Write "<card id='card1' title='搜索文章'>"
Server.ScriptTimeout=999
iduse=Session("useid")
ForumID=request("ForumID")
lasttlls="35"
lasttls
dim keyword,finfrom
finfrom=Cstr(request("finfrom"))
keyword=Cstr(request("keyword"))
   Response.write "<p>"
   response.write "<a href='ess.asp?ForumID="&ForumID&"&amp;SessionID=" & SessionID & "'>重新搜索</a><br/>----------<br/>"
if keyword<>"" then
keywords="%" & keyword & "%"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
if finfrom="1" then
     ssql="select * from wuza where biaoti like '" & keywords & "' and itid='"&ForumID&"' order by id desc"
  else
     ssql="select * from wuza where naiyo like '" & keywords & "' and itid='"&ForumID&"' order by id desc"
End if
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=20
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then
   Response.write "<br/>对不起，本坛没有你要搜索的文章！"
Else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*20-20
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
   if objgbrs("jh")="t" then
     jh="*"
   else
     jh=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),13)
   if len(objgbrs("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if
    Response.write jh & bihao+bihaocont & "." & "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
    Response.write converttowidebaiti(redtjname) & "ID:" & objgbrs("tjhm") & "(" & objgbrs("hfcont") & "/" & objgbrs("rc") & ")<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if

    response.write "<br/>--------<br/>"
If Page<objgbrs.PageCount then
    Response.Write "<anchor>下一页<go method='post' href='esscl.asp?SessionID=" & SessionID & "'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='" & (page+1) & "'/></go></anchor>"
End if
If page>1 then
    Response.Write "&nbsp;" & "<anchor>上一页<go method='post' href='esscl.asp?SessionID=" & SessionID & "'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='" & (page-1) & "'/></go></anchor>"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "&#20849;" & objgbrs.RecordCount & "&#31687;"
if objgbrs.PageCount>1 then
Response.write "<input  name='page' value='1' format='*N' size='2'/><anchor>GO>><go method='post' href='findzttcl.asp'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='$(page)'/></go></anchor>"
End if
  if page=<1 or page>1 then
   Response.write "<br/>"
  End if
  else
     Response.write "<br/>对不起，本坛没有你要搜索的文章！<br/>"
end if
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

Response.write "<a href='/BBS/forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>




