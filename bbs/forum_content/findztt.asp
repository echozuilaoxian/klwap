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
Response.Write "<card id='card1' title='搜索文章'>"
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="147"
lasttls
dim jdshow,keyword,finfrom
finfrom=Cstr(request("finfrom"))
keyword=Cstr(request("keyword"))
   Response.write "<p>"
   response.write "<a href='/bbs/xcbgs/findztt.asp?wap=" & wap & "'>重新搜索</a><br/>----------"
if keyword<>"" then
keywords="%" & keyword & "%"
jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
if finfrom="1" then
     ssql="select top 1 * from wuza where biaoti like '" & keywords & "' and itid<>'80' order by id desc"
  else
     ssql="select top 1 * from wuza where naiyo like '" & keywords & "' and itid<>'80' order by id desc"
End if
  objgbrs.open ssql,conn,1,1

if objgbrs.eof then
   Response.write "<br/>对不起，没有搜索到你想要的帖子！"
Else
For i=1 to 1
    id=objgbrs("id")
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
    Response.write "<br/>" & jh & bihao+bihaocont & "." & "<a href='zcwwcl.asp?itid=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=1&amp;wap=" & wap & "'>" & converttowidebaiti(hfyl) & "</a>"
    Response.write "<br/>" & converttowide(redtjname) & "ID:" & objgbrs("tjhm") & "(" & objgbrs("hfcont") & "/" & objgbrs("rc") & ")"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if

    response.write "<br/>--------<br/>"
If Page<objgbrs.PageCount then
    Response.Write "<anchor>下一页<go method='post' href='findzttcl.asp?wap=" & wap & "'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='page' value='" & (page+1) & "'/></go></anchor>"
End if
If page>1 then
    Response.Write "&nbsp;" & "<anchor>上一页<go method='post' href='findzttcl.asp?wap=" & wap & "'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='page' value='" & (page-1) & "'/></go></anchor>"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "&#20849;" & objgbrs.RecordCount & "&#31687;"
if objgbrs.PageCount>1 then
response.write "<a href='#card2'>按页搜索</a>"
End if
  if page=<1 or page>1 then
   Response.write "<br/>"
  End if
  else
     Response.write "<br/>对不起，没有搜索到你想要的帖子！<br/>"
end if
Response.write "<a href='/bbs/ztlb.asp?wap=" & wap & "'>回论坛</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a>"
response.write "<br/>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</p></card>"
Response.write "<card id='card2' title='按页搜索'><p>"
Response.write "<input  name='page' value='1' format='*N'/><anchor>GO<go method='post' href='findzttcl.asp'><postfield name='keyword' value='" & keyword & "'/><postfield name='finfrom' value='" & finfrom & "'/><postfield name='page' value='$(page)'/></go></anchor></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>




