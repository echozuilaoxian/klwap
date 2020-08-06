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
wap=request.querystring("wap")
Response.Write "<card id='card1' title='非法文章'>"
Server.ScriptTimeout=999
iduse=Session("useid")
dim jdshow
jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select * from wuza where Clng(itid)>14 or Clng(itid)<1 order by id desc"
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
Response.write "<p>"
if objgbrs.eof then
   Response.write "暂时没有文章记录！<br/>"
Else
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
     jh="*"
   else
     jh=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),13)
   if len(objgbrs("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if
    Response.write jh & bihao+bihaocont & "." & "<a href='zcwwcl.asp?itid=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=1&amp;wap=" & wap & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
    Response.write converttowide(redtjname) & "ID:" & objgbrs("tjhm") & "(" & objgbrs("hfcont") & "/" & objgbrs("rc") & ")<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if

    response.write "--------<br/>"
If Page<objgbrs.PageCount then
    Response.Write "<a href='newtop.asp?page=" & (page+1) & "&amp;wap=" & wap & "'>下一页</a>"
End if
If page>1 then
    Response.Write "&nbsp;" & "<a href='newtop.asp?page=" & (page-1) & "&amp;wap=" & wap & "'>上一页</a>"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "共" & objgbrs.RecordCount & "篇"
if objgbrs.PageCount>1 then
response.write "<a href='#card2'>按页搜索</a>"
End if
  if page=<1 or page>1 then
   Response.write "<br/>"
  End if
Response.write "<a href='/bbs/ztlb.asp?wap=" & wap & "'>回论坛</a>&nbsp;<a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a>"
response.write "<br/>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</p></card>"
Response.write "<card id='card2' title='跳页''><p>"
Response.write "<input  name='page' value='1' format='*N'/><anchor>GO<go method='post' href='newtop.asp'><postfield name='page' value='$(page)'/></go></anchor></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>




