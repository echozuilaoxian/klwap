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
<card id="card1" title="今日热门论坛"><p>
<%
wap=request.querystring("wap")
Server.ScriptTimeout=999
iduse=Session("useid")
itid=request("itid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 60 * from wuza where itid<>'80' and DATEDIFF('s', retimes, now()) < 1440*60 order by rc desc"
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=15
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then
Response.write "热门论坛-夜乡晨，庭燎有辉<br/>---------<br/>"
   Response.write "<br/>暂时没有热门论坛"
Else
Response.write "热门论坛-夜乡晨，庭燎有辉<br/>---------<br/>"
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*15-15
   End if
For i=1 to objgbrs.PageSize
    bihaocont=bihaocont+1
lasttlss="" & objgbrs("itid") & ""
lasttlls="" & objgbrs("itid") & ""
%>
<!--#include file="2fh.asp"--><%
    Response.write bihao+bihaocont & "." & "<a href='zcww.asp?itid=" & objgbrs("itid") & "&amp;wap=" & wap & "'>" & itidtit & "</a>(" & RecordCount & ")<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if

    response.write "------------<br/>"
If Page<objgbrs.PageCount then
    Response.Write "<a href='new.asp?page=" & (page+1) & "&amp;itid=" & itid & "&amp;wap=" & wap & "'>下页</a>"
End if
If page>1 then
    Response.Write "&nbsp;" & "<a href='new.asp?page=" & (page-1) & "&amp;itid=" & itid & "&amp;wap=" & wap & "'>上页</a>"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "共" & objgbrs.RecordCount & "个"
if objgbrs.PageCount>1 then
response.write "<br/>第<input  name='page' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='new.asp?itid=" & itid & "&amp;wap=" & wap & "'><postfield name='itid' value='" & itid & "'/><postfield name='page' value='$(page)'/></go></anchor>"
response.write ">>"
End if
  if page=<1 or page>1 then
   Response.write "<br/>"
  End if
%>
<!--#include file="1fh.asp"--><%
Response.write "<a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>回" & itidtit & "</a>"

Response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>-<a href='/index.asp?wap=" & wap & "'>首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>



