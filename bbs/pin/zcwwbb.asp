<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<% wap=request.querystring("wap") %>
<%
itid=request("itid")
biaoti=request("biaoti")
Response.Write "<card id='card1' title='调查评论'><p>"
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss=itid
lasttlls=itid
lasttls
dim jdshow
jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
  ssql="select * from wuzayy where Cstr(itid)=" & itid & " order by times desc"
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "新信息</a><br/>"
End if
Response.write "<a href='/bbs/pin/tjwzbb.asp?wap=" & wap & "'>发表评论</a><br/>-------"
if objgbrs.eof then
   Response.write "<br/>暂时没有文章"
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
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("naiyo"),8)
   if len(objgbrs("naiyo"))>8 then
    hfyl=hfyl+"..."
   End if
Response.write "<br/>" & bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;wap=" & wap & "'>ID:" & objgbrs("tjhm") & "</a>"
Response.write "|<a href='zcwwclbb.asp?itid=" & itid & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;wap=" & wap & "'>" & converttowidebaiti(hfyl) & "</a>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if

    response.write "<br/>---------<br/>"
If Page<objgbrs.PageCount then
    Response.Write "<a href='zcwwbb.asp?itid=" & itid & "&amp;page=" & (page+1) & "&amp;wap=" & wap & "'>下页</a>"
End if
If page>1 then
    Response.Write "&nbsp;" & "<a href='zcwwbb.asp?itid=" & itid & "&amp;page=" & (page-1) & "&amp;wap=" & wap & "'>上页</a>"
End if
    if objgbrs.RecordCount>objgbrs.PageSize then
    response.write "<br/>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "共" & objgbrs.RecordCount & "篇"
if objgbrs.PageCount>1 then
response.write "<a href='#card2'>跳页</a>"
End if
  if page=<1 or page>1 then
   Response.write "<br/>"
  End if
Response.write "<br/><a href='/bbs/anther/topao.asp?wap=" & wap & "'>网站调查</a>"
Response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
Response.write "<card id='card2' title='跳页'><p><input  name='page' value='1' format='*N'/><anchor>GO<go method='post' href='zcww.asp?wap=" & wap & "'><postfield name='itid' value='" & itid & "'/><postfield name='page' value='$(page)'/></go></anchor></p></card></wml>"
%>





