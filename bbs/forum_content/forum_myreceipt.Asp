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
lasttlls="145"
lasttls

id=request("id")
tjhm=request("id")
page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

if tjhm="" then
Response.write "<card id='card1' title='错误'><p>ID错误！</p></card></wml>"
End if


Response.write "<card id='card1' title='" & converttowidebaiti(redtjname) & "的所有回复'><p>"
if lycount>0 then
      Response.write "<a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&request("id")&""
End if

dim jdshow
jdshow=CLng(Session("showjd"))
set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
ssql="select * from lthf where tjhm='" &tjhm & "' order by id desc"
objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 or page="" then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then
   Response.write ""&converttowidebaiti("没有回帖记录")& "<br/>"
Else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
yxxe=objgbrs.recordcount
   Response.write "" & converttowidebaiti(redtjname) & "的回帖"&converttowidebaiti(yxxe)& "条记录<br/>"

For i=1 to objgbrs.PageSize


idx=objgbrs("id")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&idx
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="没有该帖"
else
dlname=objgbrsy("biaoti")
ForumIDD=objgbrsy("itid")
idd=objgbrsy("id")
end if
objgbrsy.close
Set objgbrsy= Nothing

    bihaocont=bihaocont+1
    tjhm=objgbrs("tjhm")
   hfyl=left(objgbrs("name"),60)
   if len(objgbrs("name"))>60 then
   hfyl=hfyl+"(url=/BBS/Forum_content/Rezcwwcl.asp?ForumID="&ForumIDD&"&amp;id="&idd&"&ids="&objgbrs("ids")&"&Page=1&SessionID="&SessionID&")详细...(/url)"
   End if

Response.write"帖子:<a href='/BBS/Forum_content/BBS_receipt_ByContent.Asp?ForumID=" & ForumIDD & "&amp;id=" & idd & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(dlname) & " </a><br/>"
Response.Write bihao+bihaocont & "." & "" & converttowidebaiti(redtjname) & ":" & converttowide(UBBCodes(hfyl))
Response.write"<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
    if objgbrs.PageCount>1 then
    response.write "---------------<br/>"
End if

If page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/forum_content/forum_myreceipt.Asp?SessionID=" & SessionID & "&amp;ID=" & id & "&amp;page="&page+1&"'>"&converttowidebaiti("下页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("下页")& ""
End if
If page>1 then
    Response.Write "<a href='/BBS/forum_content/forum_myreceipt.Asp?SessionID=" & SessionID & "&amp;ID=" & id & "&amp;page="&page-1&"'>"&converttowidebaiti("上页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("上页")& ""
End if
if objgbrs.PageCount>1 then
response.write ""&converttowidebaiti("(" &  page & "/" & objgbrs.PageCount & "/" & objgbrs.RecordCount & ")")& "<br/>"
response.write "<input  name='p' value='2' size='3' format='*N'/>"&converttowidebaiti("页")& "<anchor>"&converttowidebaiti("跳页")& "<go method='post' href='/BBS/forum_content/forum_myreceipt.Asp?SessionID=" & SessionID & "&amp;ID=" & id & "'><postfield name='page' value='$(p)'/></go></anchor><br/>"
End if

Response.write "---------------<br/><a href='/bbs/reg/useinfo.asp?SessionID=" & SessionID & "&amp;ID=" & ID & "'>返回他的资料</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"

response.write "报时:"&time&"</p></card></wml>"

conn.close
Set objgbrs= Nothing
set conn=nothing
%>
