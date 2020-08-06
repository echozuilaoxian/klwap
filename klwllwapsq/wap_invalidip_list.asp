<% response.buffer=true %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card id="card1" title="<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time) %>非法IP清单"><p>
非法IP记录 <br/>
------------<br/>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
  ssql="select * from linkipbad order by lasttime desc "
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=myunionpagesize
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then
   Response.write "暂且没有非法IP记录<br/>------------<br/>"
Else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*myunionpagesize-myunionpagesize
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
  bihaocont=bihaocont+1
if instr(CStr(objgbrs("ipbad.siteid")),"http://")=1 then
Response.write ""& bihao+bihaocont & "." & "<a href='" & objgbrs("ipbad.siteid")  & "'>" & objgbrs("ipbad.siteid") &"</a> "
else 
Response.write ""& bihao+bihaocont & "." & "<a href='site_infoedit.asp?id=" & objgbrs("id")  & "'>" & objgbrs("sitename") &"</a> "
end if
Response.write ""  & objgbrs("ipaddr") &""  
response.write body 
if not IsNull(objgbrs("lasttime")) then 
response.write String(2-Len(month(objgbrs("lasttime"))),"0") & month(objgbrs("lasttime")) & "-" & String(2-len(day(objgbrs("lasttime"))),"0") & day(objgbrs("lasttime"))  & " " & String(2-Len(hour(objgbrs("lasttime"))),"0") & hour(objgbrs("lasttime")) & ":" & String(2-len(minute(objgbrs("lasttime"))),"0") & minute(objgbrs("lasttime")) 
end if
response.write "<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next 
  End if
    
If Page<objgbrs.PageCount then
    Response.Write "<a href='invalidip_list.asp?action=" & partview & "&amp;page=" & (page+1) & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "&nbsp;<a href='invalidip_list.asp?action=" & partview & "&amp;page=" & (page-1) & "'>&#x4E0A;&#x9875;</a>"
End if
If Page<objgbrs.PageCount then
response.write "<br/>(" &  Page & "/" & objgbrs.PageCount & ")" & "&#x5171;" & objgbrs.RecordCount & "&#x4E2A;"
End if
if objgbrs.PageCount>1 then
response.write "<input  name='page' value='1' format='*N'/><a href='invalidip_list.asp?page=$(page)'>页</a>"
End if
Response.write "<br/>"
if partview="all" then
Response.write"<a href='invalidip_list.asp'>不显示引擎IP记录</a><br/>"
else
Response.write"<a href='invalidip_list.asp?action=all'>显示全部非法IP记录</a><br/>"
end if
Response.write"<a href='invalidip_list.asp?action=delold'>清除昨天以前非法IP记录</a><br/>"
Response.write "------------<br/><a href='site_manage.asp'>管理中心</a>|<a href='loginexit.asp'>安全退出</a></p></card>"

response.write "<card id='card3' title='清除成功' ontimer='invalidip_list.asp'><timer value='40'/><p>操作成功,正在返回...<br/><br/>------------<br/><a href='site_manage.asp'>管理中心</a>|<a href='loginexit.asp'>[安全退出]</a></p></card>"
response.write "<card id='card4' title='操作失败' ontimer='login.asp'><timer value='40'/><p>请重新登陆。<br/><a href='login.asp'>点击这里登陆</a></p></card></wml>"

'以下清空昨天数据

dim clear
clear=request.querystring("action")

if Session("union") = mywaphost and clear = "delold" then 
sql="delete from linkipbad where DATEDIFF('s', lasttime, now()) > 86400"
conn.Execute sql
response.redirect "invalidip_list.asp#card3"
end if
if Session("union") <> mywaphost and clear = "delold" then
response.redirect "invalidip_list.asp#card4"
end if

objgbrs.close
Set objgbrs=nothing

conn.close
set conn=nothing
%>
